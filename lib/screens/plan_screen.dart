import 'package:boxing/controllers/plan_controller.dart';
import 'package:boxing/values/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final _controller = Get.find<PlanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Training planning'.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 210, 75, 1),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tell us a little bit about yourself',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Manrope',
                    height: 1,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Please select your sex:',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(96, 94, 94, 1),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => CustomRadioBtn(
                          isActive: _controller.curSex.value == 0,
                          onTap: () {
                            _controller.curSex.value = 0;
                          },
                          title: 'Male',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Obx(
                        () => CustomRadioBtn(
                          isActive: _controller.curSex.value == 1,
                          onTap: () {
                            _controller.curSex.value = 1;
                          },
                          title: 'Female',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'How old are you?',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(96, 94, 94, 1),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _controller.ageController,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Age',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(96, 94, 94, 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color.fromRGBO(255, 210, 75, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color.fromRGBO(255, 210, 75, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'We use sex at birth and age to calculate an accurate goal for you.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(96, 94, 94, 1),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                InputBlock(
                  controller: _controller.tallController,
                  label: 'How tall are you?',
                  value: 'cm',
                ),
                const SizedBox(
                  height: 24,
                ),
                InputBlock(
                  controller: _controller.weightController,
                  label: 'How much do you weight?',
                  value: 'kg',
                ),
                const SizedBox(
                  height: 32,
                ),
                SfSliderTheme(
                  data: const SfSliderThemeData(
                    overlayColor: Color.fromRGBO(255, 210, 75, 1),
                    activeTrackColor: Color.fromRGBO(255, 210, 75, 1),
                    activeTickColor: Color.fromRGBO(255, 210, 75, 1),
                    thumbColor: Color.fromRGBO(255, 210, 75, 1),
                    thumbStrokeColor: Color.fromRGBO(255, 210, 75, 1),
                  ),
                  child: Obx(
                    () => SfSlider(
                      min: 0,
                      max: 2,
                      activeColor: const Color.fromRGBO(255, 210, 75, 1),
                      inactiveColor: const Color.fromRGBO(217, 217, 217, 1),
                      value: _controller.sliderVal.value,
                      onChanged: (value) {
                        _controller.sliderVal.value = value;
                      },
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Novice',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(96, 94, 94, 1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Amateur',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(96, 94, 94, 1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Professional',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(96, 94, 94, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                InputBlock(
                  controller: _controller.timesController,
                  label: 'How many times a week you want to work out? (1-7)',
                  value: 'times',
                ),
                const SizedBox(
                  height: 24,
                ),
                InputBlock(
                  controller: _controller.weeksController,
                  label: 'How many weeks do you want to to work out? (1-12)',
                  value: 'weeks',
                ),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: _controller.save,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppImages.longBlackButton,
                        height: 48,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        'Save'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomRadioBtn extends StatelessWidget {
  final bool isActive;
  final void Function() onTap;
  final String title;
  const CustomRadioBtn({
    super.key,
    required this.isActive,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        padding: isActive
            ? const EdgeInsets.only(left: 14, top: 16, bottom: 16, right: 12)
            : const EdgeInsets.only(left: 16, top: 18, bottom: 18, right: 14),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(234, 221, 255, 0.16),
          border: isActive
              ? Border.all(
                  width: 2,
                  color: const Color.fromRGBO(255, 210, 75, 1),
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            AnimatedContainer(
              height: 20,
              width: 20,
              duration: const Duration(
                milliseconds: 300,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: isActive
                      ? const Color.fromRGBO(255, 210, 75, 1)
                      : const Color.fromRGBO(147, 144, 144, 1),
                ),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: isActive ? 1 : 0,
                duration: const Duration(
                  milliseconds: 300,
                ),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(255, 210, 75, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputBlock extends StatelessWidget {
  final String label;
  final String value;
  final TextEditingController controller;
  const InputBlock(
      {super.key,
      required this.label,
      required this.value,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(96, 94, 94, 1),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color.fromRGBO(255, 210, 75, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color.fromRGBO(255, 210, 75, 1),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 64,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(80, 80, 80, 0.1),
                ),
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(38, 38, 38, 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
