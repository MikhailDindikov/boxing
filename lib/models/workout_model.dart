import 'package:flutter/material.dart';

class WorkoutModel {
  final String id;
  final String type;
  final String note;
  final String date;
  final String startTime;
  final String endTime;

  WorkoutModel({
    required this.id,
    required this.type,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) => WorkoutModel(
        id: json['id'].toString(),
        type: json['type'].toString(),
        note: json['note'].toString(),
        date: json['date'].toString(),
        startTime: json['startTime'].toString(),
        endTime: json['endTime'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'note': note,
        'date': date,
        'startTime': startTime,
        'endTime': endTime,
      };

  Color get color {
    switch (type) {
      case 'Punching speed':
        return const Color.fromRGBO(255, 102, 0, 1);
      case 'Endurance':
        return const Color.fromRGBO(38, 38, 38, 1);
      case 'Technique':
        return const Color.fromRGBO(225, 0, 255, 1);
      case 'General':
        return const Color.fromRGBO(0, 255, 217, 1);
      case 'Reaction':
        return const Color.fromRGBO(114, 114, 114, 1);
      default:
        return Colors.transparent;
    }
  }
}
