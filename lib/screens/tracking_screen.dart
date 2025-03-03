import 'package:boxing/controllers/tracking_controller.dart';
import 'package:boxing/models/tracking_model.dart';
import 'package:boxing/values/app_images.dart';
import 'package:boxing/values/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final _controller = Get.find<TrackingController>();

  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _placeController = TextEditingController();
  final _resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'tracking'.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 210, 75, 1),
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<TrackingController>(builder: (_) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tell us about the upcoming competition',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Manrope',
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TrackingBlock(
                    label: 'Name of the competition',
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TrackingBlock(
                    label: 'Date',
                    controller: _dateController,
                    shouldFormat: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TrackingBlock(
                    label: 'Place',
                    controller: _placeController,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TrackingBlock(
                    label: 'Result',
                    controller: _resultController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_nameController.text.isEmpty ||
                          _dateController.text.length != 10 ||
                          _placeController.text.isEmpty ||
                          _resultController.text.isEmpty) {
                        Get.showSnackbar(const GetSnackBar(
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.black,
                          messageText: Text(
                            'All fields should be filled',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ));
                      } else {
                        _controller.saveWorkout(
                          TrackingModel(
                            id: UniqueKey().toString(),
                            name: _nameController.text,
                            date: _dateController.text,
                            place: _placeController.text,
                            result: _resultController.text,
                          ),
                        );

                        _nameController.clear();
                        _dateController.clear();
                        _placeController.clear();
                        _resultController.clear();
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
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Your past competitions',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Manrope',
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  if (_controller.models.isEmpty)
                    const Center(
                      child: Text(
                        'Empty',
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
                      itemBuilder: (context, index) => TrackingCard(
                        model: _controller.models[index],
                        onDelete: () {
                          _controller.deleteWorkout(_controller.models[index]);
                        },
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemCount: _controller.models.length,
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

class TrackingCard extends StatefulWidget {
  final TrackingModel model;
  final void Function() onDelete;
  const TrackingCard({
    super.key,
    required this.model,
    required this.onDelete,
  });

  @override
  State<TrackingCard> createState() => _TrackingCardState();
}

class _TrackingCardState extends State<TrackingCard>
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
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            spacing: 1,
            flex: 1,
            onPressed: (context) {
              widget.onDelete();
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
                Text(
                  '${widget.model.date}, ${widget.model.place}',
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
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.model.name,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(255, 210, 75, 1),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              widget.model.result,
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

class TrackingBlock extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool shouldFormat;
  const TrackingBlock({
    super.key,
    required this.label,
    required this.controller,
    this.shouldFormat = false,
  });

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
        TextFormField(
          controller: controller,
          inputFormatters: shouldFormat ? [DateTextFormatter()] : null,
          keyboardType: shouldFormat ? TextInputType.number : null,
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
      ],
    );
  }
}
