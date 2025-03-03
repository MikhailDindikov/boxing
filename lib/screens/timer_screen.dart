import 'package:boxing/controllers/timer_controller.dart';
import 'package:boxing/values/app_images.dart';
import 'package:boxing/values/time_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final _controller = Get.find<TimerController>();

  void showAppWorkout() {
    final timeController =
        TextEditingController(text: _controller.settingsTime);

    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: Get.back,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: timeController,
                      inputFormatters: [TimeTextFormatter()],
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'End time',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(79, 79, 79, 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(237, 241, 247, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(237, 241, 247, 1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (timeController.text.length != 5) {
                          Get.showSnackbar(const GetSnackBar(
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.black,
                            messageText: Text(
                              'Field of time should be filled',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ));
                        } else {
                          _controller.saveTime(timeController.text);
                            
                          Get.back();
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            AppImages.longBlackButton,
                            height: 48,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            'save'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 43,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 210, 75, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'timer'.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 210, 75, 1),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25).copyWith(bottom: 60),
          child: GetBuilder<TimerController>(builder: (_) {
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: Obx(() {
                      final minutes = (_controller.remainingTime.value ~/ 60)
                          .toString()
                          .padLeft(2, '0');
                      final seconds = (_controller.remainingTime.value % 60)
                          .toString()
                          .padLeft(2, '0');
                      return Text(
                        '$minutes:$seconds',
                        style: TextStyle(
                          fontSize: 128,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      );
                    }),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_controller.timer == null) {
                      _controller.startTimer();
                    } else {
                      if (_controller.isPause) {
                        _controller.play();
                      } else {
                        _controller.pause();
                      }
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppImages.longBlackButton,
                        height: 48,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        _controller.timer == null
                            ? 'Fight!'.toUpperCase()
                            : _controller.isPause
                                ? 'PLAY'
                                : 'PAUSE',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: showAppWorkout,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              AppImages.longBlackButton,
                              height: 48,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              'Settings'.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _controller.reset();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              AppImages.longBlackButton,
                              height: 48,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              'Reset'.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
