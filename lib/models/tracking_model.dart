class TrackingModel {
  final String id;
  final String name;
  final String date;
  final String place;
  final String result;

  TrackingModel({
    required this.id,
    required this.name,
    required this.date,
    required this.place,
    required this.result,
  });

  factory TrackingModel.fromJson(Map<String, dynamic> json) => TrackingModel(
        id: json['id'],
        name: json['name'],
        date: json['date'],
        place: json['place'],
        result: json['result'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'date': date,
        'place': place,
        'result': result,
      };
}
