import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/stacionar_menu/lunch_menu_provider.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/stacionar_menu/svatek_provider.dart';
import 'package:stacionar_app/models/lunch_menu.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';
import 'package:stacionar_app/shared/extensions/widget_extension.dart';
import 'package:stacionar_app/shared/util/svatek_api.dart';

class StacionarMenu extends ConsumerWidget {
  const StacionarMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Svatek> svatek = ref.watch(svatekProvider);
    bool isNextWeek = ref.watch(lunchMenuProvider);
    int weekNumber = ref.watch(weekCycleProvider);
    int week = isNextWeek
        ? weekNumber == 5
            ? 1
            : weekNumber + 1
        : weekNumber;
    List<Lunch> menu = lunchList.where((element) => element.week == week).toList();
    return Scaffold(
      appBar: AppBar(
          // centerTitle: true,

          ),
      body: Column(
        children: [
          switch (svatek) {
            AsyncData(:final value) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dnes je ${value.dayInWeek},\n${value.dayNumber}.${value.monthNumber} a svátek má:',
                      style: context.textTheme.bodyLarge),
                  Text(
                    value.name,
                    style: context.textTheme.titleLarge,
                  )
                ],
              ),
            AsyncError() => Text(
                'Oops, something unexpected happened',
                style: context.textTheme.bodyMedium,
              ),
            _ => const CircularProgressIndicator(),
          },
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text('Co je tento týden \ndobrého k obědu?', style: context.textTheme.bodyLarge),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Příští týden', style: context.textTheme.bodyLarge),
                  ),
                  SizedBox(
                    height: 30,
                    child: Switch(
                      value: isNextWeek,
                      onChanged: (value) {
                        ref.read(lunchMenuProvider.notifier).switchWeek(value);
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
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: menu.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(color: context.primary, borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      title: Text(
                        menu[index].day,
                        style: context.textTheme.bodyMedium,
                      ),
                      subtitle: Text(
                        menu[index].name,
                        style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ));
              },
            ),
          ),
        ],
      ).paddingHorizontal(20),
    );
  }
}
