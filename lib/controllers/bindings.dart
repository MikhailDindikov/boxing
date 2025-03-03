import 'package:boxing/controllers/plan_controller.dart';
import 'package:boxing/controllers/timer_controller.dart';
import 'package:boxing/controllers/timetable_controller.dart';
import 'package:boxing/controllers/tracking_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PlanController());
    Get.put(TimetableController());
    Get.put(TimerController());
    Get.put(TrackingController());
  }
}
