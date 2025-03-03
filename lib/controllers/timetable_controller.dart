import 'package:boxing/models/workout_model.dart';
import 'package:boxing/values/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimetableController extends GetxController {
  Rx<DateTime> selectedDay = DateTime.now().obs;
  List<WorkoutModel> monthModels = [];
  List<WorkoutModel> thisMonthModels = [];
  List<WorkoutModel> todayModels = [];

  Future<void> getData() async {
    monthModels = await AppUtils.getWorkoutsForMonthYesr(
        '${selectedDay.value.day < 10 ? '0${selectedDay.value.day}' : selectedDay.value.day}.${selectedDay.value.month < 10 ? '0${selectedDay.value.month}' : selectedDay.value.month}.${selectedDay.value.year}');

    todayModels = await AppUtils.getWorkoutsForDate(
        '${DateTime.now().day < 10 ? '0${DateTime.now().day}' : DateTime.now().day}.${DateTime.now().month < 10 ? '0${DateTime.now().month}' : DateTime.now().month}.${DateTime.now().year}');

    update();
  }

  List<Color> getColorsForDay(DateTime day) {
    final workouts = monthModels.where(
      (e) =>
          e.date ==
          '${day.day < 10 ? '0${day.day}' : day.day}.${day.month < 10 ? '0${day.month}' : day.month}.${day.year}',
    );

    if (workouts.isEmpty) {
      return [Colors.transparent];
    } else {
      return workouts.map((e) => e.color).toList();
    }
  }

  Future<void> saveWorkout(WorkoutModel model) async {
    await AppUtils.addWorkout(model);
    await getData();
  }

  Future<void> changeWorkout(
      WorkoutModel oldModel, WorkoutModel newModel) async {
    await AppUtils.changeWorkout(oldModel, newModel);
    await getData();
  }

  Future<void> deleteWorkout(WorkoutModel model) async {
    await AppUtils.deleteWorkout(model);
    await getData();
  }
}
