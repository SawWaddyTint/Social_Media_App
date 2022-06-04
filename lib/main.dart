import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/data/models/authentication_model_impl.dart';
import 'package:social_media_app/fcm/fcm_service.dart';
import 'package:social_media_app/pages/login_page.dart';
import 'package:social_media_app/pages/news_feed_page.dart';
import 'package:firebase_installations/firebase_installations.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FCMService().listenForMessages();

  var firebaseInstallationId =
      await FirebaseInstallations.id ?? "Unknown installation id";
  debugPrint("Firebase Installation id =====> $firebaseInstallationId");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _authenticationModel = AuthenticationModelImpl();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: (_authenticationModel.isLoggedIn())
          ? const NewsFeedPage()
          : const LoginPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
