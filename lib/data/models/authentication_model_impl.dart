import 'package:social_media_app/data/models/authentication_model.dart';
import 'package:social_media_app/data/vos/user_vo.dart';
import 'package:social_media_app/network/real_time_database_data_agent_impl.dart';
import 'package:social_media_app/network/social_data_agent.dart';

class AuthenticationModelImpl extends AuthenticationModel {
  static final AuthenticationModelImpl _singleton =
      AuthenticationModelImpl._internal();

  factory AuthenticationModelImpl() {
    return _singleton;
  }

  AuthenticationModelImpl._internal();

  SocialDataAgent mDataAgent = RealtimeDatabaseDataAgentImpl();

  @override
  Future<void> registerNewUser(String email, String userName, String password) {
    return craftUserVO(email, userName, password).then((userData) {
      mDataAgent.registerNewUser(userData);
    });
  }

  Future<UserVO> craftUserVO(String email, String userName, String password) {
    var newUser =
        UserVO(id: "", userName: userName, email: email, password: password);
    return Future.value(newUser);
  }

  @override
  UserVO getLoggedInUser() {
    return mDataAgent.getLogInUser();
  }

  @override
  bool isLoggedIn() {
    return mDataAgent.isLogIn();
  }

  @override
  Future logIn(String email, String password) {
    return mDataAgent.logIn(email, password);
  }

  @override
  Future logOut() {
    return mDataAgent.logOut();
  }
}
