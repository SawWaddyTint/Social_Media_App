import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social_media_app/analytics/firebase_analytics_tracker.dart';
import 'package:social_media_app/data/models/authentication_model.dart';
import 'package:social_media_app/data/models/authentication_model_impl.dart';
import 'package:social_media_app/data/models/social_model.dart';
import 'package:social_media_app/data/models/social_model_impl.dart';
import 'package:social_media_app/data/vos/news_feed_vo.dart';
import 'package:social_media_app/data/vos/user_vo.dart';
import 'package:social_media_app/remote_config/fireabase_remote_config.dart';

class AddNewPostBloc extends ChangeNotifier {
  /// State
  String newPostDescription = "";
  bool isAddNewPostError = false;
  bool isDisposed = false;

  UserVO? _loggedInUser;

  /// Model
  final SocialModel _model = SocialModelImpl();
  final AuthenticationModel _authenticationModel = AuthenticationModelImpl();

  ///Image
  File? chosenImageFile;
  bool isLoading = false;
  String imageUrl = "";

  /// For Edit Mode
  bool isInEditMode = false;
  String userName = "";
  String profilePicture = "";
  NewsFeedVO? mNewsFeed;
  Color themeColor = Colors.black;

  // Remote Configs
  final FirebaseRemoteConfig _firebaseRemoteConfig = FirebaseRemoteConfig();
  AddNewPostBloc({int? newsFeedId}) {
    _loggedInUser = _authenticationModel.getLoggedInUser();
    if (newsFeedId != null) {
      isInEditMode = true;
      _prepopulateDataForEditMode(newsFeedId);
    } else {
      _prepopulateDataForAddNewPost();
    }
    _sendAnalyticsData(addNewPostScreenReached, null);

    void _getRemoteConfigAndChangeTheme() {}
    themeColor = _firebaseRemoteConfig.getThemeColorFromRemoteConfig();
    _notifySafely();
  }
  void _sendAnalyticsData(String name, Map<String, String>? parameters) async {
    await FirebaseAnalyticsTracker().logEvent(name, parameters);
  }

  void onImageChosen(File choseFile) {
    chosenImageFile = choseFile;
    _notifySafely();
  }

  void _prepopulateDataForAddNewPost() {
    userName = _authenticationModel.getLoggedInUser().userName ?? "";
    profilePicture =
        "https://i1.wp.com/allovershayari.com/wp-content/uploads/2021/05/Dp-For-Girls-For-Instagram-AOS.jpg?resize=400%2C400&ssl=1";
    _notifySafely();
  }

  void _prepopulateDataForEditMode(int newsFeedId) {
    _model.getNewsFeedbyId(newsFeedId).listen((newsFeed) {
      chosenImageFile = null;
      userName = newsFeed.userName ?? "";
      profilePicture = newsFeed.profilePicture ?? "";
      newPostDescription = newsFeed.description ?? "";
      imageUrl = newsFeed.postImage ?? "";
      mNewsFeed = newsFeed;
      _notifySafely();
    });
  }

  void onTapDeleteImage() {
    chosenImageFile = null;
    imageUrl = "";
    _notifySafely();
  }

  void onNewPostTextChanged(String newPostDescription) {
    this.newPostDescription = newPostDescription;
  }

  Future onTapAddNewPost() {
    if (newPostDescription.isEmpty) {
      isAddNewPostError = true;
      _notifySafely();
      return Future.error("Error");
    } else {
      isAddNewPostError = false;
      _notifySafely();
      isLoading = true;
      _notifySafely();
      if (isInEditMode) {
        return _editNewsFeedPost().then((value) {
          isLoading = false;
          _notifySafely();
          _sendAnalyticsData(
              editPostAction, {postId: mNewsFeed?.id.toString() ?? ""});
        });
      } else {
        return _createNewsFeedPost().then((value) {
          isLoading = false;
          _notifySafely();
          _sendAnalyticsData(addNewPostAction, null);
        });
      }
    }
  }

  Future<void> _editNewsFeedPost() {
    mNewsFeed?.description = newPostDescription;
    if (mNewsFeed != null) {
      return _model.editPost(mNewsFeed!, chosenImageFile);
    } else {
      return Future.error("Error");
    }
  }

  Future<void> _createNewsFeedPost() {
    return _model.addNewPost(newPostDescription, chosenImageFile);
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
