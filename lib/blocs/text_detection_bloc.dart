import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:social_media_app/ml_kit/ml_kit_text_recognition.dart';

class TextDetectionBloc extends ChangeNotifier {
  File? chosenImageFile;

  // MLKit

  final MLKitTextRecognition _mlKitTextDetection = MLKitTextRecognition();

  onImageChosen(File imageFile, Uint8List bytes) {
    chosenImageFile = imageFile;
    _mlKitTextDetection.detectTexts(imageFile);
    notifyListeners();
  }
}
