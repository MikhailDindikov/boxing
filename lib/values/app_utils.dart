import 'dart:convert';

import 'package:apphud/apphud.dart';
import 'package:boxing/models/tracking_model.dart';
import 'package:boxing/models/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  static late final SharedPreferences prefs;
  static late RxBool isPrem;
  static RxBool isPremLoad = false.obs;
  static RxBool isRestLoad = false.obs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    isPrem = (AppUtils.prefs.getBool('hasPrem') ?? false).obs;
  }

  static Future<void> purchase() async {
    isPremLoad.value = true;
    final result = await Apphud.purchase(productId: 'premium');

    isPremLoad.value = false;
    if (result.error == null) {
      isPrem.value = true;
      AppUtils.prefs.setBool('hasPrem', true);

      Get.showSnackbar(GetSnackBar(
        duration: 2.seconds,
        backgroundColor: Colors.black,
        messageText: const Text(
          'Succeesful purchase!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: 2.seconds,
        backgroundColor: Colors.black,
        messageText: const Text(
          'Some error happens',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ));
    }
  }

  static Future<void> restorePurchases() async {
    isRestLoad.value = true;
    final items = await Apphud.restorePurchases();
    isRestLoad.value = false;
    if (items.purchases.isNotEmpty) {
      final ids = items.purchases.map((e) => e.productId).toList();
      if (ids.contains('premium')) {
        isPrem.value = true;
        AppUtils.prefs.setBool('hasPrem', true);
      } else {
        Get.showSnackbar(GetSnackBar(
          duration: 2.seconds,
          backgroundColor: Colors.black,
          messageText: const Text(
            'No purchases',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ));
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: 2.seconds,
        backgroundColor: Colors.black,
        messageText: const Text(
          'No purchases',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ));
    }
  }

  static Future<List<WorkoutModel>> getWorkouts() async {
    final jsonData = prefs.getString('workouts') ?? '{"data": []}';

    final rawData = json.decode(jsonData);

    return (rawData['data'] as List<dynamic>)
        .map((e) => WorkoutModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static Future<List<WorkoutModel>> getWorkoutsForMonthYesr(String date) async {
    final jsonData = prefs.getString('workouts') ?? '{"data": []}';

    final rawData = json.decode(jsonData);

    return (rawData['data'] as List<dynamic>)
        .map((e) => WorkoutModel.fromJson(e as Map<String, dynamic>))
        .where((e) => e.date.substring(3) == date.substring(3))
        .toList();
  }

  static Future<List<WorkoutModel>> getWorkoutsForDate(String date) async {
    final jsonData = prefs.getString('workouts') ?? '{"data": []}';

    final rawData = json.decode(jsonData);

    return (rawData['data'] as List<dynamic>)
        .map((e) => WorkoutModel.fromJson(e as Map<String, dynamic>))
        .where((e) => e.date == date)
        .toList();
  }

  static Future<void> addWorkout(WorkoutModel model) async {
    final workouts = await getWorkouts();
    workouts.add(model);
    await prefs.setString(
        'workouts',
        json.encode({
          'data': workouts.map((e) => e.toJson()).toList(),
        }));

    return;
  }

  static Future<void> changeWorkout(
    WorkoutModel oldModel,
    WorkoutModel newModel,
  ) async {
    final workouts = await getWorkouts();
    final ind = workouts.indexWhere((e) => e.id == oldModel.id);
    workouts[ind] = newModel;
    await prefs.setString(
        'workouts',
        json.encode({
          'data': workouts.map((e) => e.toJson()).toList(),
        }));

    return;
  }

  static Future<void> deleteWorkout(WorkoutModel model) async {
    final workouts = await getWorkouts();
    workouts.removeWhere((e) => e.id == model.id);

    await prefs.setString(
        'workouts',
        json.encode({
          'data': workouts.map((e) => e.toJson()).toList(),
        }));

    return;
  }

  static Future<List<TrackingModel>> getTracking() async {
    final jsonData = prefs.getString('tracking') ?? '{"data": []}';

    final rawData = json.decode(jsonData);

    return (rawData['data'] as List<dynamic>)
        .map((e) => TrackingModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static Future<void> addTracking(TrackingModel model) async {
    final workouts = await getTracking();
    workouts.add(model);
    await prefs.setString(
        'tracking',
        json.encode({
          'data': workouts.map((e) => e.toJson()).toList(),
        }));

    return;
  }

  static Future<void> deleteTracking(TrackingModel model) async {
    final workouts = await getTracking();
    workouts.removeWhere((e) => e.id == model.id);

    await prefs.setString(
        'tracking',
        json.encode({
          'data': workouts.map((e) => e.toJson()).toList(),
        }));

    return;
  }
}
