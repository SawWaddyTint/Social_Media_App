import 'dart:io';

import 'package:social_media_app/data/models/authentication_model.dart';
import 'package:social_media_app/data/models/authentication_model_impl.dart';
import 'package:social_media_app/data/models/social_model.dart';
import 'package:social_media_app/data/vos/news_feed_vo.dart';
import 'package:social_media_app/network/cloud_firestore_data_agent_impl.dart';
import 'package:social_media_app/network/real_time_database_data_agent_impl.dart';
import 'package:social_media_app/network/social_data_agent.dart';

class SocialModelImpl extends SocialModel {
  @override
  static final SocialModelImpl _singleton = SocialModelImpl._internal();

  factory SocialModelImpl() {
    return _singleton;
  }

  SocialModelImpl._internal();

  SocialDataAgent mDataAgent = RealtimeDatabaseDataAgentImpl();
  // SocialDataAgent mDataAgent = CloudFireStoreDataAgentImpl();

  /// Auth Models
  final AuthenticationModel _authenticationModel = AuthenticationModelImpl();

  Stream<List<NewsFeedVO>> getNewsFeed() {
    return mDataAgent.getNewsFeed();
  }

  @override
  Stream<NewsFeedVO> getNewsFeedbyId(int newsFeedId) {
    return mDataAgent.getNewsFeedById(newsFeedId);
  }

  @override
  Future<void> addNewPost(String description, File? imageFile) {
    if (imageFile != null) {
      return mDataAgent.uploadFileToFirebase(imageFile).then((imageUrl) {
        craftNewsFeed(description, imageUrl).then((newsPost) {
          mDataAgent.addNewPost(newsPost);
        });
      });
    } else {
      return craftNewsFeed(description, "").then((newsPost) {
        mDataAgent.addNewPost(newsPost);
      });
    }
  }

  Future<NewsFeedVO> craftNewsFeed(String description, String imageUrl) {
    var currentMilliSecond = DateTime.now().millisecondsSinceEpoch;
    var newsPost = NewsFeedVO(
        currentMilliSecond,
        description,
        "https://i1.wp.com/allovershayari.com/wp-content/uploads/2021/05/Dp-For-Girls-For-Instagram-AOS.jpg?resize=400%2C400&ssl=1",
        _authenticationModel.getLoggedInUser().userName,
        imageUrl);
    return Future.value(newsPost);
  }

  @override
  Future<void> deletePost(int postId) {
    return mDataAgent.deletePost(postId);
  }

  @override
  Future<void> editPost(NewsFeedVO newsFeed, File? imageFile) {
    if (imageFile != null) {
      return mDataAgent.uploadFileToFirebase(imageFile).then((downloadUrl) {
        newsFeed.postImage = downloadUrl;
        mDataAgent.addNewPost(newsFeed);
      });
    } else {
      return mDataAgent.addNewPost(newsFeed);
    }
  }
}
