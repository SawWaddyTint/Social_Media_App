import 'package:social_media_app/data/vos/user_vo.dart';

abstract class AuthenticationModel {
  Future<void> registerNewUser(String email, String userName, String password);
  Future logIn(String email, String password);
  bool isLoggedIn();
  UserVO getLoggedInUser();
  Future logOut();
}
