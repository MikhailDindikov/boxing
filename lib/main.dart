import 'package:apphud/apphud.dart';
import 'package:boxing/controllers/bindings.dart';
import 'package:boxing/screens/main_screen.dart';
import 'package:boxing/screens/onboarding_screen.dart';
import 'package:boxing/values/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppUtils.init();
  await Apphud.start(apiKey: 'app_fesPTEai4SuDfZfEZWtkYmsmcckpBM');
  final boxShowIntro = AppUtils.prefs.getBool('boxShowIntro') ?? true;
  
  runApp(MyApp(
    showBoxIntro: boxShowIntro,
  ));
}

class MyApp extends StatelessWidget {
  final bool showBoxIntro;
  const MyApp({super.key, required this.showBoxIntro});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      title: 'Boxing Way',
      theme: ThemeData(
        fontFamily: 'Bebas',
        useMaterial3: false,
      ),
      home: MediaQuery.withNoTextScaling(
        child: showBoxIntro ? const OnboardingScreen() : const MainScreen(),
      ),
    );
  }
}
