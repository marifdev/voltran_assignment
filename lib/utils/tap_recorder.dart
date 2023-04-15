class TapRecorder {
  List<int> taps = [];
  List<int> delays = [];

  void recordTap() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (taps.isEmpty) {
      taps.add(now);
    } else {
      delays.add(now - taps.last);
      taps.add(now);
    }
  }

  void playbackTaps(Function(int) onTap) async {
    for (int i = 0; i < taps.length; i++) {
      onTap(i);
      if (i < delays.length) {
        await Future.delayed(Duration(milliseconds: delays[i]));
      }
    }
  }
}
