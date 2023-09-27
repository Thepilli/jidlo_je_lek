import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/applications_list.dart';
import 'package:stacionar_app/features/core/navigation_tabs/articles/articles_home_page.dart';
import 'package:stacionar_app/features/core/navigation_tabs/help_page/help_page.dart';
import 'package:stacionar_app/features/core/navigation_tabs/meal_plan/meal_plan_page.dart';
import 'package:stacionar_app/features/core/root_page/widgets/nav_tab.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';
import 'package:stacionar_app/shared/util/theme_provider.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Opravdu chceš odejít?', style: context.textTheme.bodyLarge),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Ne'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Ano'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }

  Future<void> showAlertDialog(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ahoj Co je noveho?', style: context.textTheme.bodyLarge),
            content: Text(
                'Nyni se muzes prihlasit a aplikace si te bude pamatovat. Do sekce "clanky" pribylo nekolik novych prispevku, a take "FAQ" prinasi zakladni pravidla jak pro nemocne, tak pro jejich blizke',
                style: context.textTheme.bodyMedium),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      await prefs.setBool('isFirstTime', false);
    }
  }

  void loggout(BuildContext context) {
    AwesomeDialog(
      context: context,
      keyboardAware: true,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      customHeader: const Image(image: AssetImage('assets/icons/icon_logout.png'), height: 80),
      animType: AnimType.bottomSlide,
      btnCancelText: "Ne",
      btnOkText: "Ano,",
      title: 'Opravdu se chceš odhlásit??',
      titleTextStyle: context.textTheme.bodyMedium?.apply(fontWeightDelta: 2),
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        FirebaseAuth.instance.signOut();
      },
    ).show();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = ref.watch(darkThemeSwitchProvider);
    List<Widget> myTabs = TabList().myTabs;

    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            bottom: TabBar(
              tabs: myTabs,
              indicator: BoxDecoration(
                color: context.primary,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            leading: IconButton(
              onPressed: () => loggout(context),
              icon: const Icon(
                Icons.logout,
              ),
            ),
            centerTitle: true,
            title: Text('Jídlo je lék', style: context.textTheme.titleMedium),
            actions: [
              IconButton(
                onPressed: () {
                  ref.read(darkThemeSwitchProvider.notifier).switchTheme();
                },
                icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode_outlined),
                color: Colors.amber,
              ),
              //
            ],
          ),
          body: const TabBarView(
            children: [
              ArticlesHomePage(),
              MealPlanPage(),
              ApplicationsList(),
              HelpPage(),
            ],
          ),
        ),
      ),
    );
  }
}
