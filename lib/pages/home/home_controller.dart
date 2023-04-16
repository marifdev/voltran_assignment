import 'package:get/get.dart';

class MyHomePageController extends GetxController {
  List<Duration> tapDurations = [];
  List<Duration> newDurations = [];
  var tapCount = 0.obs;
  DateTime? lastTapTime;
  var isIncreasing = false.obs;

  void onTap() {
    final currentTime = DateTime.now();
    final duration = lastTapTime != null ? currentTime.difference(lastTapTime!) : Duration.zero;
    lastTapTime = currentTime;
    if (isIncreasing.value) {
      newDurations.add(duration);
    } else {
      tapDurations.add(duration);
    }
  }

  Future<void> onLongPress() async {
    isIncreasing.value = true;
    for (var duration in tapDurations) {
      await Future.delayed(duration);
      tapCount++;
    }

    if (newDurations.isNotEmpty) {
      tapDurations = List.from(newDurations);
      newDurations.clear();
      await onLongPress();
    }

    tapDurations = [];
    lastTapTime = null;
    isIncreasing.value = false;
  }
}