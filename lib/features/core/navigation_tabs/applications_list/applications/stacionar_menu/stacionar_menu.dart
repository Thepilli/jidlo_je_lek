import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stacionar_app/constants/colors.dart';
import 'package:stacionar_app/utils/svatek_api.dart';
import 'package:stacionar_app/widgets/contrained_container.dart';

class StacionarMenu extends StatefulWidget {
  const StacionarMenu({super.key});

  @override
  State<StacionarMenu> createState() => _StacionarMenuState();
}

var isDark = Get.isDarkMode;

class _StacionarMenuState extends State<StacionarMenu> {
  int weekNumber = 0;
  int cycleNumber = 0;
  bool isNextWeek = false;
  String svatekDnes = '';
  String dayNumber = '';
  String dayInWeek = '';
  String monthNumber = '';
  Svatek? svatek;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    weekNumber = getWeekNumber(now);
    fetchSvatek();
    cycleNumber = getCycleNumber(weekNumber);
  }

  int getWeekNumber(DateTime date) {
    int dayOfYear = int.parse(date.difference(DateTime(date.year, 1, 1)).inDays.toString()) + 1;
    int weekNumber = ((dayOfYear - date.weekday + 10) ~/ 7);
    if (weekNumber < 1) {
      weekNumber = 52 + weekNumber;
    }
    return weekNumber;
  }

  int getCycleNumber(int weekNumber) {
    return ((weekNumber - 1) % 5) + 1;
  }

  Future<void> fetchSvatek() async {
    final response = await http.get(Uri.parse('https://svatkyapi.cz/api/day'));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final svatek = Svatek.fromJson(jsonBody);
      setState(() {
        this.svatek = svatek;
      });
    } else {
      throw Exception('Failed to fetch svatek');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (svatek != null) {
      svatekDnes = svatek!.name;
      dayNumber = svatek!.dayNumber;
      dayInWeek = svatek!.dayInWeek..toUpperCase();
      monthNumber = svatek!.monthNumber;
    }
    debugPrint('weekNumber: ${weekNumber.toString()}');

    if (isNextWeek) {
      if (cycleNumber == 5) {
        cycleNumber = 1;
      } else {
        cycleNumber = getCycleNumber(weekNumber) + 1;
      }
    } else {
      cycleNumber = getCycleNumber(weekNumber);
    }
    var isDark = Get.isDarkMode;
    var iconColor = isDark ? jPrimaryDarkColor : jPrimaryLightColor;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: iconColor),
        elevation: 0, titleSpacing: 0,

        // centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 200),
          child: Text(
            'Menu :',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body: ConstrainedContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dnes je $dayInWeek,\n$dayNumber.$monthNumber a svátek má:',
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text(
                    svatekDnes,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('Co je tento týden \ndobrého k obědu?', style: Theme.of(context).textTheme.headlineMedium),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Příští týden', style: Theme.of(context).textTheme.headlineMedium),
                      ),
                      SizedBox(
                        height: 30,
                        child: Switch(
                          activeColor: iconColor,
                          value: isNextWeek,
                          onChanged: (value) {
                            setState(() {
                              isNextWeek = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              courseLayout(context, cycleNumber),
            ],
          ),
        ),
      ),
    );
  }
}

Widget courseLayout(BuildContext context, int cycleNumber) {
  var isDark = Get.isDarkMode;
  var containerColor = isDark ? jPrimaryDarkColor : jPrimaryLightColor;

  List menu = [
    [
      'Pondělí',
      'Brambory, kuřecí stehno',
      const Color(0xffD3DEFA),
      1,
    ],
    [
      'Úterý',
      'Hamburská pečeně, knedlíky',
      const Color(0xffD3DEFA),
      1,
    ],
    [
      'Středa',
      'Bramborová kaše, karbanátek',
      const Color(0xffD3DEFA),
      1,
    ],
    [
      'Čtvrtek',
      'Rýže, kuře na kari',
      const Color(0xffD3DEFA),
      1,
    ],
    [
      'Pátek ',
      'Šťouchané brambory, krůtí roláda',
      const Color(0xffD3DEFA),
      1,
    ],
    [
      'Pondělí',
      'Koprová omáčka, hovězí, vejce',
      const Color(0xffD3DEFA),
      2,
    ],
    [
      'Úterý',
      'Kroupová kaše, sekaná, okurka',
      const Color(0xffD3DEFA),
      2,
    ],
    [
      'Středa',
      'Těstoviny, kuře po toskánsku',
      const Color(0xffD3DEFA),
      2,
    ],
    [
      'Čtvrtek',
      'Rýže, hovězí plátek, rajčatový salát',
      const Color(0xffD3DEFA),
      2,
    ],
    [
      'Pátek ',
      'Segedinský guláš, knedlíky',
      const Color(0xffD3DEFA),
      2,
    ],
    [
      'Pondělí',
      'Bramborová kaše, kuře, nádivka',
      const Color(0xffD3DEFA),
      3,
    ],
    [
      'Úterý',
      'Těstoviny, kuře na paprice',
      const Color(0xffD3DEFA),
      3,
    ],
    [
      'Středa',
      'Bramborová kaše, holandský řízek, okurkový salát',
      const Color(0xffD3DEFA),
      3,
    ],
    [
      'Čtvrtek',
      'Svíčková omáčka, knedlíky',
      const Color(0xffD3DEFA),
      3,
    ],
    [
      'Pátek ',
      'Rýže, roláda',
      const Color(0xffD3DEFA),
      3,
    ],
    [
      'Pondělí',
      'Bramborová kaše, file, okurkový salát',
      const Color(0xffD3DEFA),
      4,
    ],
    [
      'Úterý',
      'Houbová omáčka, knedlíky',
      const Color(0xffD3DEFA),
      4,
    ],
    [
      'Středa',
      'Zapačené brambory s kuřecím masem',
      const Color(0xffD3DEFA),
      4,
    ],
    [
      'Čtvrtek',
      'Brambory, Ćevapčići ',
      const Color(0xffD3DEFA),
      4,
    ],
    [
      'Pátek ',
      'Bramborové knedlíky, vepřové, špenát',
      const Color(0xffD3DEFA),
      4,
    ],
    [
      'Pondělí',
      'Bramborové knedlíky, kuře, zeli',
      const Color(0xffD3DEFA),
      5,
    ],
    [
      'Úterý',
      'Rajská omáčka, těstoviny',
      const Color(0xffD3DEFA),
      5,
    ],
    [
      'Středa',
      'Bramborová kaše, rizek, kompot',
      const Color(0xffD3DEFA),
      5,
    ],
    [
      'Čtvrtek',
      'Guláš, knedlíky',
      const Color(0xffD3DEFA),
      5,
    ],
    [
      'Pátek ',
      'Lepenice, uzené',
      const Color(0xffD3DEFA),
      5,
    ],
  ];
  final filteredItems = menu.where((item) => item[3] == cycleNumber).toList();
  debugPrint('cycleNumber: ${cycleNumber.toString()}');

  return MasonryGridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 1,
    mainAxisSpacing: 10,
    crossAxisSpacing: 23,
    itemCount: menu.where((item) => item[3] == cycleNumber).length,
    itemBuilder: (BuildContext context, int index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          height: 50,
          color: containerColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: 80,
                child:
                    Text(filteredItems[index][0], style: Theme.of(context).textTheme.labelLarge?.apply(fontSizeFactor: 1.1)),
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 1,
                width: 20,
              ),
              // const DottedLine(
              //   direction: Axis.vertical,
              // ),
              Flexible(
                child: SizedBox(
                  child: Text(
                    filteredItems[index][1],
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
