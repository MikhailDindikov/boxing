import 'package:boxing/screens/system_screen.dart';
import 'package:boxing/values/app_icons.dart';
import 'package:boxing/values/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(255, 210, 75, 1),
          ),
        ),
        title: Text(
          'settings'.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 210, 75, 1),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 48,
              ),
              _SettingsCard(
                iconPath: AppIcons.privacy,
                label: 'Privacy Policy',
                onTap: () {
                  Get.to(() => SystemScreen(
                        type: 'Privacy Policy',
                      ));
                },
              ),
              const SizedBox(
                height: 22,
              ),
              _SettingsCard(
                iconPath: AppIcons.terms,
                label: 'Terms of Use',
                onTap: () {
                  Get.to(() => SystemScreen(
                        type: 'Terms of Use',
                      ));
                },
              ),
              const SizedBox(
                height: 22,
              ),
              _SettingsCard(
                iconPath: AppIcons.support,
                label: 'Support',
                onTap: () {
                  Get.to(() => SystemScreen(
                        type: 'Support',
                      ));
                },
              ),
              const SizedBox(
                height: 22,
              ),
              _SettingsCard(
                iconPath: AppIcons.clear,
                label: 'Clear Data',
                onTap: () {
                  final hasPrem = AppUtils.prefs.getBool('hasPrem') ?? false;
                  AppUtils.prefs.clear().then((_) {
                    Get.showSnackbar(const GetSnackBar(
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.black,
                      messageText: Text(
                        'Data has been deleted successfully!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ));

                    AppUtils.prefs.setBool('boxShowIntro', false);
                    AppUtils.prefs.setBool('hasPrem', hasPrem);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final String iconPath;
  final String label;
  final void Function() onTap;
  const _SettingsCard({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
          ),
          const SizedBox(
            width: 19,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset(
            AppIcons.next,
          ),
        ],
      ),
    );
  }
}
