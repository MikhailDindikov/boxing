import 'package:boxing/controllers/timetable_controller.dart';
import 'package:boxing/models/workout_model.dart';
import 'package:boxing/values/app_icons.dart';
import 'package:boxing/values/app_images.dart';
import 'package:boxing/values/date_formatter.dart';
import 'package:boxing/values/time_formatter.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  final _controller = Get.find<TimetableController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.getData();
    });
  }

  void showAppWorkout(WorkoutModel? model) {
    final types = [
      'Punching speed',
      'Endurance',
      'Technique',
      'General',
      'Reaction',
    ];

    final expandableController = ExpandableController();

    RxInt curType = (model == null ? -1 : types.indexOf(model.type)).obs;
    final noteController =
        TextEditingController(text: model == null ? '' : model.note);
    final dateController =
        TextEditingController(text: model == null ? '' : model.date);
    final startController =
        TextEditingController(text: model == null ? '' : model.startTime);
    final endController =
        TextEditingController(text: model == null ? '' : model.endTime);

    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: Get.back,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ExpandableNotifier(
                          controller: expandableController,
                          child: Expandable(
                            collapsed: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                expandableController.toggle();
                                setState(() {});
                              },
                              child: Container(
                                height: 64,
                                padding:
                                    const EdgeInsets.only(left: 12, right: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(237, 241, 247, 1),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(
                                      () => Text(
                                        curType.value == -1
                                            ? 'Type of training'
                                            : types[curType.value],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Manrope',
                                          color: Color.fromRGBO(79, 79, 79, 1),
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      AppIcons.next,
                                      color:
                                          const Color.fromRGBO(79, 79, 79, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            expanded: Column(
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    expandableController.toggle();
                                  },
                                  child: Container(
                                    height: 64,
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            237, 241, 247, 1),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(
                                          () => Text(
                                            curType.value == -1
                                                ? 'Type of training'
                                                : types[curType.value],
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Manrope',
                                              color:
                                                  Color.fromRGBO(79, 79, 79, 1),
                                            ),
                                          ),
                                        ),
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: SvgPicture.asset(
                                            AppIcons.next,
                                            color: const Color.fromRGBO(
                                                79, 79, 79, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: types.length,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      curType.value = index;
                                    },
                                    child: Obx(
                                      () => Container(
                                        height: 64,
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 20),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                237, 241, 247, 1),
                                          ),
                                          color: curType.value == index
                                              ? Color.fromRGBO(255, 210, 75, 1)
                                              : null,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              types[index],
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Manrope',
                                                color: curType.value == index
                                                    ? Colors.white
                                                    : Color.fromRGBO(
                                                        255, 210, 75, 1),
                                              ),
                                            ),
                                            Opacity(
                                              opacity: curType.value == index
                                                  ? 1
                                                  : 0.1,
                                              child: SvgPicture.asset(
                                                AppIcons.selected,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          minLines: 3,
                          maxLines: 3,
                          controller: noteController,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Type the note here...',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(79, 79, 79, 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(237, 241, 247, 1),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(237, 241, 247, 1),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: dateController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [DateTextFormatter()],
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Date',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(79, 79, 79, 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(237, 241, 247, 1),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(237, 241, 247, 1),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: startController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [TimeTextFormatter()],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Start time',
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(79, 79, 79, 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(237, 241, 247, 1),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(237, 241, 247, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: endController,
                                inputFormatters: [TimeTextFormatter()],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'End time',
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(79, 79, 79, 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(237, 241, 247, 1),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(237, 241, 247, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (curType.value == -1 ||
                                dateController.text.length != 10 ||
                                startController.text.length != 5 ||
                                endController.text.length != 5) {
                              Get.showSnackbar(const GetSnackBar(
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.black,
                                messageText: Text(
                                  'Fields of type, date, start time and end time should be filled',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ));
                            } else {
                              if (model == null) {
                                _controller.saveWorkout(
                                  WorkoutModel(
                                    id: UniqueKey().toString(),
                                    type: types[curType.value],
                                    note: noteController.text,
                                    date: dateController.text,
                                    startTime: startController.text,
                                    endTime: endController.text,
                                  ),
                                );
                              } else {
                                _controller.changeWorkout(
                                  model,
                                  WorkoutModel(
                                    id: UniqueKey().toString(),
                                    type: types[curType.value],
                                    note: noteController.text,
                                    date: dateController.text,
                                    startTime: startController.text,
                                    endTime: endController.text,
                                  ),
                                );
                              }
                              Get.back();
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                AppImages.longBlackButton,
                                height: 48,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                model == null
                                    ? 'create a workout'.toUpperCase()
                                    : 'save'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 43,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Timetable'.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 210, 75, 1),
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<TimetableController>(builder: (_) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => TableCalendar(
                      focusedDay: _controller.selectedDay.value,
                      onDaySelected: (selectedDay, focusedDay) {},
                      onPageChanged: (focusedDay) {
                        _controller.selectedDay.value = focusedDay;
                        _controller.getData();
                      },
                      headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                        leftChevronIcon: SizedBox(),
                        rightChevronIcon: SizedBox(),
                        // titleTextStyle:
                        //     TeText.header5.copyWith(color: TeColors.black),
                      ),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      firstDay: DateTime.utc(DateTime.now().year - 1,
                          DateTime.now().month, DateTime.now().day),
                      lastDay: DateTime.utc(DateTime.now().year + 1,
                          DateTime.now().month, DateTime.now().day),
                      daysOfWeekHeight: 20,
                      calendarStyle: const CalendarStyle(),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(38, 38, 38, 1),
                        ),
                        weekendStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(38, 38, 38, 1),
                        ),
                      ),
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          // final notedate = teNotesController.teNotedates
                          //     .firstWhereOrNull((element) => element.day == day.day);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                day.day.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 210, 75, 1),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                height: 4,
                                width: 24,
                                child: Builder(builder: (context) {
                                  final colors =
                                      _controller.getColorsForDay(day);
                                  return Row(
                                    children: List.generate(
                                      colors.length,
                                      (index) => Expanded(
                                        child: Container(
                                          height: 4,
                                          color: colors[index],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          );
                        },
                        todayBuilder: (context, day, focusedDay) {
                          // final notedate = teNotesController.teNotedates
                          //     .firstWhereOrNull((element) => element.day == day.day);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                day.day.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 210, 75, 1),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                height: 4,
                                width: 24,
                                child: Builder(builder: (context) {
                                  final colors =
                                      _controller.getColorsForDay(day);
                                  return Row(
                                    children: List.generate(
                                      colors.length,
                                      (index) => Expanded(
                                        child: Container(
                                          height: 4,
                                          color: colors[index],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          );
                        },
                        outsideBuilder: (context, day, focusedDay) {
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IntrinsicWidth(
                        child: Column(
                          children: [
                            const Text(
                              'Punching speed',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(255, 102, 0, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 4,
                              width: double.infinity,
                              color: const Color.fromRGBO(255, 102, 0, 1),
                            ),
                          ],
                        ),
                      ),
                      IntrinsicWidth(
                        child: Column(
                          children: [
                            const Text(
                              'Endurance',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(38, 38, 38, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 4,
                              width: double.infinity,
                              color: const Color.fromRGBO(38, 38, 38, 1),
                            ),
                          ],
                        ),
                      ),
                      IntrinsicWidth(
                        child: Column(
                          children: [
                            const Text(
                              'Technique',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(225, 0, 255, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 4,
                              width: double.infinity,
                              color: const Color.fromRGBO(225, 0, 255, 1),
                            ),
                          ],
                        ),
                      ),
                      IntrinsicWidth(
                        child: Column(
                          children: [
                            const Text(
                              'General',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 255, 217, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 4,
                              width: double.infinity,
                              color: const Color.fromRGBO(0, 255, 217, 1),
                            ),
                          ],
                        ),
                      ),
                      IntrinsicWidth(
                        child: Column(
                          children: [
                            const Text(
                              'Reaction',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(114, 114, 114, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 4,
                              width: double.infinity,
                              color: const Color.fromRGBO(114, 114, 114, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  GestureDetector(
                    onTap: () {
                      showAppWorkout(null);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppImages.longBlackButton,
                          height: 48,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'Add a workout'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Today:'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(96, 94, 94, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (_controller.todayModels.isEmpty)
                    const Center(
                      child: Text(
                        'Rest day',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => WorkoutCard(
                        model: _controller.todayModels[index],
                        onChange: () {
                          showAppWorkout(_controller.todayModels[index]);
                        },
                        onDalete: () {
                          _controller
                              .deleteWorkout(_controller.todayModels[index]);
                        },
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemCount: _controller.todayModels.length,
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class WorkoutCard extends StatefulWidget {
  final WorkoutModel model;
  final void Function() onChange;
  final void Function() onDalete;
  const WorkoutCard(
      {super.key,
      required this.model,
      required this.onChange,
      required this.onDalete});

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard>
    with TickerProviderStateMixin {
  late final SlidableController _slidableController;

  @override
  void initState() {
    _slidableController = SlidableController(this);
    _slidableController.isLeftToRight = true;

    //_slidableController.direction.value =0;
    super.initState();
  }

  @override
  void dispose() {
    _slidableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      controller: _slidableController,
      useTextDirection: false,
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.2,
        dragDismissible: false,
        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          widget.onDalete();
        }),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            spacing: 1,
            flex: 1,
            onPressed: (context) {
              widget.onDalete();
            },
            backgroundColor: const Color.fromRGBO(222, 1, 1, 1),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(16).copyWith(left: 14),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.5,
                      color: widget.model.color,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  '${widget.model.startTime}-${widget.model.endTime}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(79, 79, 79, 1),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: widget.onChange,
                  child: const Icon(
                    Icons.more_horiz,
                    color: Color.fromRGBO(79, 79, 79, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${widget.model.type} training',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
                color: widget.model.color,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              widget.model.note,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(79, 79, 79, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
