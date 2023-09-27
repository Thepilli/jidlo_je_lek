import 'package:flutter/material.dart';

class Lunch {
  final String day;
  final String name;
  final Color color;
  final int week;

  Lunch({
    required this.week,
    required this.day,
    required this.name,
    required this.color,
  });
}

List<Lunch> lunchList = [
  Lunch(
    day: 'Pondělí',
    name: 'Brambory, kuřecí stehno',
    color: const Color(0xffD3DEFA),
    week: 1,
  ),
  Lunch(
    day: 'Úterý',
    name: 'Hamburská pečeně, knedlíky',
    color: const Color(0xffD3DEFA),
    week: 1,
  ),
  Lunch(
    day: 'Středa',
    name: 'Bramborová kaše, karbanátek',
    color: const Color(0xffD3DEFA),
    week: 1,
  ),
  Lunch(
    day: 'Čtvrtek',
    name: 'Rýže, kuře na kari',
    color: const Color(0xffD3DEFA),
    week: 1,
  ),
  Lunch(
    day: 'Pátek ',
    name: 'Šťouchané brambory, krůtí roláda',
    color: const Color(0xffD3DEFA),
    week: 1,
  ),
  Lunch(
    day: 'Pondělí',
    name: 'Koprová omáčka, hovězí, vejce',
    color: const Color(0xffD3DEFA),
    week: 2,
  ),
  Lunch(
    day: 'Úterý',
    name: 'Kroupová kaše, sekaná, okurka',
    color: const Color(0xffD3DEFA),
    week: 2,
  ),
  Lunch(
    day: 'Středa',
    name: 'Těstoviny, kuře po toskánsku',
    color: const Color(0xffD3DEFA),
    week: 2,
  ),
  Lunch(
    day: 'Čtvrtek',
    name: 'Rýže, hovězí plátek, rajčatový salát',
    color: const Color(0xffD3DEFA),
    week: 2,
  ),
  Lunch(
    day: 'Pátek ',
    name: 'Segedinský guláš, knedlíky',
    color: const Color(0xffD3DEFA),
    week: 2,
  ),
  Lunch(
    day: 'Pondělí',
    name: 'Bramborová kaše, kuře, nádivka',
    color: const Color(0xffD3DEFA),
    week: 3,
  ),
  Lunch(
    day: 'Úterý',
    name: 'Těstoviny, kuře na paprice',
    color: const Color(0xffD3DEFA),
    week: 3,
  ),
  Lunch(
    day: 'Středa',
    name: 'Bramborová kaše, holandský řízek, okurkový salát',
    color: const Color(0xffD3DEFA),
    week: 3,
  ),
  Lunch(
    day: 'Čtvrtek',
    name: 'Svíčková omáčka, knedlíky',
    color: const Color(0xffD3DEFA),
    week: 3,
  ),
  Lunch(
    day: 'Pátek ',
    name: 'Rýže, roláda',
    color: const Color(0xffD3DEFA),
    week: 3,
  ),
  Lunch(
    day: 'Pondělí',
    name: 'Bramborová kaše, file, okurkový salát',
    color: const Color(0xffD3DEFA),
    week: 4,
  ),
  Lunch(
    day: 'Úterý',
    name: 'Houbová omáčka, knedlíky',
    color: const Color(0xffD3DEFA),
    week: 4,
  ),
  Lunch(
    day: 'Středa',
    name: 'Zapačené brambory s kuřecím masem',
    color: const Color(0xffD3DEFA),
    week: 4,
  ),
  Lunch(
    day: 'Čtvrtek',
    name: 'Brambory, Ćevapčići ',
    color: const Color(0xffD3DEFA),
    week: 4,
  ),
  Lunch(
    day: 'Pátek ',
    name: 'Bramborové knedlíky, vepřové, špenát',
    color: const Color(0xffD3DEFA),
    week: 4,
  ),
  Lunch(
    day: 'Pondělí',
    name: 'Bramborové knedlíky, kuře, zeli',
    color: const Color(0xffD3DEFA),
    week: 5,
  ),
  Lunch(
    day: 'Úterý',
    name: 'Rajská omáčka, těstoviny',
    color: const Color(0xffD3DEFA),
    week: 5,
  ),
  Lunch(
    day: 'Středa',
    name: 'Bramborová kaše, rizek, kompot',
    color: const Color(0xffD3DEFA),
    week: 5,
  ),
  Lunch(
    day: 'Čtvrtek',
    name: 'Guláš, knedlíky',
    color: const Color(0xffD3DEFA),
    week: 5,
  ),
  Lunch(
    day: 'Pátek ',
    name: 'Lepenice, uzené',
    color: const Color(0xffD3DEFA),
    week: 5,
  ),
];
