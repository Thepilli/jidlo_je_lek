import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lunch_menu_provider.g.dart';

@riverpod
class LunchMenu extends _$LunchMenu {
  @override
  bool build() {
    return false;
  }

  void switchWeek(bool value) {
    state = value;
  }
}

@riverpod
class WeekCycle extends _$WeekCycle {
  @override
  int build() {
    final weekNumber = getWeekNumber();
    final cycleNumber = getCycleNumber(weekNumber);

    return cycleNumber;
  }

  int getWeekNumber() {
    int dayOfYear = int.parse(
          DateTime.now()
              .difference(
                DateTime(DateTime.now().year, 1, 1),
              )
              .inDays
              .toString(),
        ) +
        1;
    int weekNumber = ((dayOfYear - DateTime.now().weekday + 10) ~/ 7);
    if (weekNumber < 1) {
      weekNumber = 52 + weekNumber;
    }
    return weekNumber;
  }

  int getCycleNumber(int weekNumber) {
    return ((weekNumber - 1) % 5) + 1;
  }
}
