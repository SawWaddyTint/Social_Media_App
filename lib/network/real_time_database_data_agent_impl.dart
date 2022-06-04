import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_media_app/data/vos/news_feed_vo.dart';
import 'package:social_media_app/data/vos/user_vo.dart';
import 'package:social_media_app/network/social_data_agent.dart';

///Database paths
const newsFeedPath = "newsfeed";
const fileUploadRef = "uploads";
const userPath = "user";

class RealtimeDatabaseDataAgentImpl extends SocialDataAgent {
  static final RealtimeDatabaseDataAgentImpl _singleton =
      RealtimeDatabaseDataAgentImpl._internal();

  factory RealtimeDatabaseDataAgentImpl() {
    return _singleton;
  }

  RealtimeDatabaseDataAgentImpl._internal();

  ///Database
  var databaseRef = FirebaseDatabase.instance.reference();

  ///Storage
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  ///Auth
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Stream<List<NewsFeedVO>> getNewsFeed() {
    return databaseRef.child(newsFeedPath).onValue.map((event) {
      return event.snapshot.value.values.map<NewsFeedVO>((element) {
        return NewsFeedVO.fromJson(Map<String, dynamic>.from(element));
      }).toList();
    });
  }

  @override
  Future<void> addNewPost(NewsFeedVO newsfeed) {
    return databaseRef
        .child(newsFeedPath)
        .child(newsfeed.id.toString())
        .set(newsfeed.toJson());
  }

  @override
  Future<void> deletePost(int postId) {
    return databaseRef.child(newsFeedPath).child(postId.toString()).remove();
  }

  @override
  Stream<NewsFeedVO> getNewsFeedById(int postId) {
    return databaseRef
        .child(newsFeedPath)
        .child(postId.toString())
        .once()
        .asStream()
        .map((newsFeed) {
      return NewsFeedVO.fromJson(Map<String, dynamic>.from(newsFeed.value));
    });
  }

  @override
  Future<String> uploadFileToFirebase(image) {
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
    return databaseRef
        .child(userPath)
        .child(newUser.id.toString())
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
