import 'package:flutter/material.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class NavTab extends StatelessWidget {
  final String iconPath;
  final String label;

  const NavTab({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Image.asset(
              iconPath,
              width: 45,
              height: 45,
            ),
          ),
          FittedBox(child: Text(label, textAlign: TextAlign.center, style: context.textTheme.bodySmall)),
        ],
      ),
    );
  }
}

class TabList {
  List<Widget> myTabs = [
    const NavTab(
      label: 'Články',
      iconPath: 'assets/icons/tab_icon_dictionary.png',
    ), // blog tab
    const NavTab(
      label: 'Jídelní plán',
      iconPath: 'assets/icons/tab_icon_plan.png',
    ), // plan tab
    const NavTab(
      label: 'Applikace',
      iconPath: 'assets/icons/tab_icon_app.png',
    ), // app tab
    const NavTab(
      label: 'Odkazy',
      iconPath: 'assets/icons/tab_icon_help.png',
    ), // help tab
  ];
}
