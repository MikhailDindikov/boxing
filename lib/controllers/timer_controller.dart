import 'dart:async';

import 'package:boxing/values/app_utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  late String settingsTime;
  late RxInt remainingTime;
  Timer? timer;
  bool isPause = false;

  @override
  void onInit() {
    settingsTime = AppUtils.prefs.getString('settingsTime') ?? '02:00';

    final parts = settingsTime.split(':');
    if (parts.length != 2) return;

    final minutes = int.tryParse(parts[0]) ?? 0;
    final seconds = int.tryParse(parts[1]) ?? 0;

    remainingTime = (minutes * 60 + seconds).obs;

    super.onInit();
  }

  void saveTime(String newTime) {
    AppUtils.prefs.setString('settingsTime', newTime);
  }

  void reset() {
    timer?.cancel();
    timer = null;

    isPause = false;
    settingsTime = AppUtils.prefs.getString('settingsTime') ?? '02:00';

    final parts = settingsTime.split(':');
    if (parts.length != 2) return;

    final minutes = int.tryParse(parts[0]) ?? 0;
    final seconds = int.tryParse(parts[1]) ?? 0;

    remainingTime.value = minutes * 60 + seconds;

    update();
  }

  void startTimer() {
    final parts = settingsTime.split(':');
    if (parts.length != 2) return;

    final minutes = int.tryParse(parts[0]) ?? 0;
    final seconds = int.tryParse(parts[1]) ?? 0;

    remainingTime.value = minutes * 60 + seconds;

    timer?.cancel(); // Отменяем предыдущий таймер, если он есть
    timer = Timer.periodic(Duration(seconds: 1), (tmr) {
      if (remainingTime.value > 0) {
        if (!isPause) {
          remainingTime.value--;
        }
      } else {
        timer?.cancel();
        timer = null;
        HapticFeedback.vibrate();
        HapticFeedback.vibrate();
        HapticFeedback.vibrate();
        HapticFeedback.vibrate();

        update();
      }
    });

    update();
  }

  void pause() {
    isPause = true;
    update();
  }

  void play() {
    isPause = false;
    update();
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
