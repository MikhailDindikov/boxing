import 'package:boxing/screens/arcticles_screen.dart';
import 'package:boxing/screens/plan_screen.dart';
import 'package:boxing/screens/timer_screen.dart';
import 'package:boxing/screens/timetable_screen.dart';
import 'package:boxing/screens/tracking_screen.dart';
import 'package:boxing/values/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final RxInt _curScreen = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      body: Obx(
        () => IndexedStack(
          index: _curScreen.value,
          children: const [
            ArcticlesScreen(),
            PlanScreen(),
            TimetableScreen(),
            TimerScreen(),
            TrackingScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            _curScreen.value = value;
          },
          currentIndex: _curScreen.value,
          backgroundColor: const Color.fromRGBO(255, 210, 75, 1),
          selectedItemColor: const Color.fromRGBO(38, 38, 38, 1),
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Manrope',
            color: Color.fromRGBO(38, 38, 38, 1),
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Manrope',
            color: Colors.white,
          ),
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: SvgPicture.asset(
                AppIcons.home,
              ),
              activeIcon: SvgPicture.asset(
                AppIcons.home,
                color: const Color.fromRGBO(38, 38, 38, 1),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Plan',
              icon: SvgPicture.asset(
                AppIcons.plan,
              ),
              activeIcon: SvgPicture.asset(
                AppIcons.plan,
                color: const Color.fromRGBO(38, 38, 38, 1),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Timetable',
              icon: SvgPicture.asset(
                AppIcons.timetable,
              ),
              activeIcon: SvgPicture.asset(
                AppIcons.timetable,
                color: const Color.fromRGBO(38, 38, 38, 1),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Timer',
              icon: SvgPicture.asset(
                AppIcons.timer,
              ),
              activeIcon: SvgPicture.asset(
                AppIcons.timer,
                color: const Color.fromRGBO(38, 38, 38, 1),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Tracking',
              icon: SvgPicture.asset(
                AppIcons.tracking,
              ),
              activeIcon: SvgPicture.asset(
                AppIcons.tracking,
                color: const Color.fromRGBO(38, 38, 38, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
