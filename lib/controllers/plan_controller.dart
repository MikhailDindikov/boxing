import 'package:boxing/values/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanController extends GetxController {
  late final RxInt curSex;
  late final RxDouble sliderVal;
  final ageController = TextEditingController();
  final tallController = TextEditingController();
  final weightController = TextEditingController();
  final timesController = TextEditingController();
  final weeksController = TextEditingController();

  @override
  void onInit() {
    print('onInits');
    final presf = AppUtils.prefs;

    curSex = (presf.getInt('curSex') ?? 0).obs;
    sliderVal = (presf.getDouble('sliderVal') ?? 0.0).obs;
    ageController.text = presf.getString('ageController') ?? '';
    tallController.text = presf.getString('tallController') ?? '';
    weightController.text = presf.getString('weightController') ?? '';
    timesController.text = presf.getString('timesController') ?? '';
    weeksController.text = presf.getString('weeksController') ?? '';

    super.onInit();
  }

  Future<void> save() async {
    final presf = await SharedPreferences.getInstance();

    presf.setInt('curSex', curSex.value);
    presf.setDouble('sliderVal', sliderVal.value);
    presf.setString('ageController', ageController.text);
    presf.setString('tallController', tallController.text);
    presf.setString('weightController', weightController.text);
    presf.setString('timesController', timesController.text);
    presf.setString('weeksController', weeksController.text);
  }
}
