import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/tap_recorder.dart';

class MyHomePageController extends GetxController {
  final TapRecorder _recorder = TapRecorder();
  final count = 0.obs;
  final fabColor = Colors.blue.obs;

  void recordTap() {
    _recorder.recordTap();
  }

  void startRecording() {
    fabColor.value = Colors.red;
  }

  void stopRecording() {
    fabColor.value = Colors.blue;
    _recorder.playbackTaps((_) => count.value++);
  }
}
