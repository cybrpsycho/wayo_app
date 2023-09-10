Future<void> simulateLatency({bool longLoadTime = false}) async {
  await Future.delayed(Duration(milliseconds: longLoadTime ? 2000 : 400));
}
