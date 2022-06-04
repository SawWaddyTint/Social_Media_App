import 'dart:io';

import 'package:social_media_app/data/vos/news_feed_vo.dart';

abstract class SocialModel {
  Stream<List<NewsFeedVO>> getNewsFeed();
  Stream<NewsFeedVO> getNewsFeedbyId(int newsFeedId);
  Future<void> addNewPost(String description, File? imageFile);
  Future<void> deletePost(int postId);
  Future<void> editPost(NewsFeedVO newsFeed, File? imageFile);
}
