import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacionar_app/main.dart';

class FoodMenuScreen extends StatefulWidget {
  @override
  State<FoodMenuScreen> createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  int weekNumber = 0;
  int cycleNumber = 0;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    weekNumber = getWeekNumber(now);
    cycleNumber = getCycleNumber(weekNumber);
  }

  int getWeekNumber(DateTime date) {
    int dayOfYear = int.parse(
            date.difference(DateTime(date.year, 1, 1)).inDays.toString()) +
        1;
    int weekNumber = ((dayOfYear - date.weekday + 10) ~/ 7);
    if (weekNumber < 1) {
      weekNumber = 52 + weekNumber;
    }
    return weekNumber;
  }

  int getCycleNumber(int weekNumber) {
    return ((weekNumber - 1) % 5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current week number: $weekNumber and cycle number: $cycleNumber',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Co je dnes\ndobreho k obedu?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://www.pngall.com/wp-content/uploads/5/Pikachu-PNG-Image-File.png',
                        ),
                      ),
                    ),
                  )
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
  List menu = [
    ['Pondeli', 'Koprova omacka, hovezi, vejce', Color(0xffD3DEFA), 2],
    ['Utery', 'Kroupova kase, sekana, okurka', Color(0xffD3DEFA), 2],
    ['Streda', 'Testoviny, kure po toskansku', Color(0xffD3DEFA), 2],
    ['Ctvrtek', 'Ryze, hovezi platek, rajcatovy salat', Color(0xffD3DEFA), 2],
    ['Patek', 'Segedinsky gulas, knedliky', Color(0xffD3DEFA), 2],
    ['Pondeli', 'Bramkova kase, kure, nadivka', Color(0xffD3DEFA), 3],
    ['Utery', 'Testoviny, kure na paprice', Color(0xffD3DEFA), 3],
    [
      'Streda',
      'Bramborova kase, holandsky rizek, okurkovy salat',
      Color(0xffD3DEFA),
      3
    ],
    ['Ctvrtek', 'Svickova omacka, knedliky', Color(0xffD3DEFA), 3],
    ['Patek', 'Ryze, rolada', Color(0xffD3DEFA), 3],
    ['Pondeli', 'Bramborova kase, file, okurkovy salat', Color(0xffD3DEFA), 4],
    ['Utery', 'Houbova omacka, knedliky', Color(0xffD3DEFA), 4],
    ['Streda', 'Zapacene brambory s kurecim masem', Color(0xffD3DEFA), 4],
    ['Ctvrtek', 'Brambory, cevapcici', Color(0xffD3DEFA), 4],
    ['Patek', 'Bramborove knedliky, veprove, spenat', Color(0xffD3DEFA), 4],
    ['Pondeli', 'Bramborove knedliky, kure, zeli', Color(0xffD3DEFA), 5],
    ['Utery', 'Rajska omacka, testoviny', Color(0xffD3DEFA), 5],
    ['Streda', 'Bramborova kase, rizek, kompot', Color(0xffD3DEFA), 5],
    ['Ctvrtek', 'Gulas, knedliky', Color(0xffD3DEFA), 5],
    ['Patek', 'Lepenice, uzene', Color(0xffD3DEFA), 5],
    ['Pondeli', 'Brambory, kureci stehno', Color(0xffD3DEFA), 1],
    ['Utery', 'Hamburska pecene, knedliky', Color(0xffD3DEFA), 1],
    ['Streda', 'Bramborova kase, karbanatek', Color(0xffD3DEFA), 1],
    ['Ctvrtek', 'Ryze, kure na kari', Color(0xffD3DEFA), 1],
    ['Patek', 'Bramborova kase, rolada', Color(0xffD3DEFA), 1],
  ];
  final filteredItems = menu.where((item) => item[3] == cycleNumber).toList();

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
          height: 50,
          color: filteredItems[index][2],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                filteredItems[index][0],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Text(filteredItems[index][1],
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.clip),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      );
    },
  );
}
