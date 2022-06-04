import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_media_app/data/vos/news_feed_vo.dart';
import 'package:social_media_app/data/vos/user_vo.dart';
import 'package:social_media_app/network/social_data_agent.dart';

///News Feed Collection
const newsFeedCollection = "newsfeed";
const fileUploadRef = "uploads";
const userCollection = "user";

class CloudFireStoreDataAgentImpl extends SocialDataAgent {
  ///Database
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  ///Storage
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  ///Auth
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<void> addNewPost(NewsFeedVO newsfeed) {
    return _fireStore
        .collection(newsFeedCollection)
        .doc(newsfeed.id.toString())
        .set(newsfeed.toJson());
  }

  @override
  Future<void> deletePost(int postId) {
    return _fireStore
        .collection(newsFeedCollection)
        .doc(postId.toString())
        .delete();
  }

  @override
  Stream<List<NewsFeedVO>> getNewsFeed() {
    return _fireStore
        .collection(newsFeedCollection)
        .snapshots()
        .map((querySnapShot) {
      return querySnapShot.docs.map<NewsFeedVO>((document) {
        return NewsFeedVO.fromJson(document.data());
      }).toList();
    });
  }

  @override
  Stream<NewsFeedVO> getNewsFeedById(int postId) {
    return _fireStore
        .collection(newsFeedCollection)
        .doc(postId.toString())
        .get()
        .asStream()
        .where((documentSnapShots) => documentSnapShots.data != null)
        .map((documentSnapShot) =>
            NewsFeedVO.fromJson(documentSnapShot.data()!));
  }

  @override
  Future<String> uploadFileToFirebase(File image) {
    return firebaseStorage
        .ref(fileUploadRef)
        .child("${DateTime.now().millisecondsSinceEpoch}")
        .putFile(image)
        .then((taskSnapShot) => taskSnapShot.ref.getDownloadURL());
  }

  @override
  Future registerNewUser(UserVO newUser) {
    return auth
        .createUserWithEmailAndPassword(
            email: newUser.email ?? "", password: newUser.password ?? "")
        .then((credential) =>
            credential.user?..updateDisplayName(newUser.userName ?? ""))
        .then((user) {
      newUser.id = user?.uid ?? "";
      _addNewUser(newUser);
    });
  }

  Future<void> _addNewUser(UserVO newUser) {
    return _fireStore
        .collection(userCollection)
        .doc(newUser.id.toString())
        .set(newUser.toJson());
  }

  @override
  UserVO getLogInUser() {
    return UserVO(
        id: auth.currentUser?.uid,
        userName: auth.currentUser?.displayName,
        email: auth.currentUser?.email);
  }

  @override
  bool isLogIn() {
    return auth.currentUser != null;
  }

  @override
  Future logIn(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future logOut() {
    return auth.signOut();
  }
}
