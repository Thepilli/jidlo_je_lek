class Svatek {
  Svatek({
    required this.date,
    required this.dayNumber,
    required this.dayInWeek,
    required this.monthNumber,
    required this.year,
    required this.name,
    required this.isHoliday,
  });

  String date;
  String dayNumber;
  String dayInWeek;
  String monthNumber;
  String year;
  String name;
  bool isHoliday;

  static Svatek fromJson(json) => Svatek(
        date: json["date"] ?? '',
        dayNumber: json["dayNumber"] ?? '',
        dayInWeek: json["dayInWeek"] ?? '',
        monthNumber: json["monthNumber"] ?? '',
        year: json["year"] ?? '',
        name: json["name"] ?? '',
        isHoliday: json["isHoliday"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "dayNumber": dayNumber,
        "dayInWeek": dayInWeek,
        "monthNumber": monthNumber,
        "year": year,
        "name": name,
        "isHoliday": isHoliday,
      };
}
