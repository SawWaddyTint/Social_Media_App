import 'package:flutter/cupertino.dart';
import 'package:social_media_app/data/models/authentication_model.dart';
import 'package:social_media_app/data/models/authentication_model_impl.dart';

class LoginBloc extends ChangeNotifier {
  bool isLoading = false;
  String email = "";
  String password = "";
  bool isDisposed = false;

  /// Model
  final AuthenticationModel _model = AuthenticationModelImpl();

  Future onTapLogin() {
    _showLoading();
    return _model.logIn(email, password).whenComplete(() => _hideLoading());
  }

  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void onEmailChanged(String email) {
    this.email = email;
  }

  void onPasswordChanged(String password) {
    this.password = password;
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
