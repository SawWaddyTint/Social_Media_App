import 'package:flutter/cupertino.dart';
import 'package:social_media_app/analytics/firebase_analytics_tracker.dart';
import 'package:social_media_app/data/models/authentication_model.dart';
import 'package:social_media_app/data/models/authentication_model_impl.dart';
import 'package:social_media_app/data/models/social_model.dart';
import 'package:social_media_app/data/models/social_model_impl.dart';
import 'package:social_media_app/data/vos/news_feed_vo.dart';

class NewsFeedBloc extends ChangeNotifier {
  ///State
  List<NewsFeedVO>? newsFeed;

  bool isDisposed = false;

  ///Model
  final SocialModel _mSocialModel = SocialModelImpl();
  final AuthenticationModel _mAuthenticationModel = AuthenticationModelImpl();

  NewsFeedBloc() {
    _mSocialModel.getNewsFeed().listen((newsFeedList) {
      newsFeed = newsFeedList;
      if (!isDisposed) {
        notifyListeners();
      }
    });
    _sendAnalyticsData();
  }

  void _sendAnalyticsData() async {
    await FirebaseAnalyticsTracker().logEvent(homeScreenReached, null);
  }

  Future<void> onTapDeletePost(int postId) async {
    await _mSocialModel.deletePost(postId);
  }

  Future onTapLogout() {
    return _mAuthenticationModel.logOut();
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
