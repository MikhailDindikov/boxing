import 'package:boxing/screens/main_screen.dart';
import 'package:boxing/values/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();

  String _path(int index) {
    switch (index) {
      case 0:
        return AppImages.lion1;
      case 1:
        return AppImages.lion2;
      case 2:
        return AppImages.lion3;
      default:
        return '';
    }
  }

  String _label(int index) {
    switch (index) {
      case 0:
        return 'Hone your strokes with exercises in the app'.toUpperCase();
      case 1:
        return 'Create your own training plan'.toUpperCase();
      case 2:
        return 'Learn new techniques and improve'.toUpperCase();
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(38, 38, 38, 1),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: 3,
          itemBuilder: (context, index) => _OnboardingSection(
            path: _path(index),
            label: _label(index),
            onTap: () async {
              if (index != 2) {
                _pageController.jumpToPage(index + 1);
              } else {
                final boxSP = await SharedPreferences.getInstance();
                boxSP.setBool('boxShowIntro', false);

                Get.offAll(() => const MainScreen());
              }
            },
          ),
        ),
      ),
    );
  }
}

class _OnboardingSection extends StatelessWidget {
  final String path;
  final String label;
  final void Function() onTap;
  const _OnboardingSection({
    required this.path,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(path),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 122,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -16,
                      child: Text(
                        'Learn boxing\ntechniques'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 64,
                          height: 1,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(239, 239, 239, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
               Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(239, 239, 239, 1),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: onTap,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppImages.yellowButton,
                        height: 48,
                      ),
                      Text(
                        path == AppImages.lion3
                            ? 'start'.toUpperCase()
                            : 'next'.toUpperCase(),
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
        ),
      ],
    );
  }
}
