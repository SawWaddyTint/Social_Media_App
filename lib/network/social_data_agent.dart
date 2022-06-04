import 'dart:io';

import 'package:social_media_app/data/vos/news_feed_vo.dart';
import 'package:social_media_app/data/vos/user_vo.dart';

abstract class SocialDataAgent {
  Stream<List<NewsFeedVO>> getNewsFeed();
  Future<void> addNewPost(NewsFeedVO newsfeed);
  Future<void> deletePost(int postId);
  Stream<NewsFeedVO> getNewsFeedById(int postId);
  Future<String> uploadFileToFirebase(File image);

  ///Authentication
  Future registerNewUser(UserVO newUser);
  Future logIn(String email, String password);
  bool isLogIn();
  UserVO getLogInUser();
  Future logOut();
}
