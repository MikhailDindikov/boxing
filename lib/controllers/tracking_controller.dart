import 'package:boxing/models/tracking_model.dart';
import 'package:boxing/values/app_utils.dart';
import 'package:get/get.dart';

class TrackingController extends GetxController {
  List<TrackingModel> models = [];

  Future<void> getData() async {
    models = await AppUtils.getTracking();
    update();
  }

  Future<void> saveWorkout(TrackingModel model) async {
    await AppUtils.addTracking(model);
    await getData();
  }

  Future<void> deleteWorkout(TrackingModel model) async {
    await AppUtils.deleteTracking(model);
    await getData();
  }
}
