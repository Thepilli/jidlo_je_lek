import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stacionar_app/features/authentication/auth.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/BMI/bmi_calculator_screen.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/fortune_wheel/fortune_wheel_page.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/meal_inspiration/meal_inspiration.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/relaxation/relaxation_page.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/stacionar_menu/stacionar_menu.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/video_player/video_page.dart';
import 'package:stacionar_app/features/core/navigation_tabs/meal_plan/meal_plan_detail.dart';
import 'package:stacionar_app/models/meal_plans.dart';
import 'package:stacionar_app/shared/widgets/gallery_pop.dart';

part 'app_router.g.dart';

enum Routes {
  home,
  auth,
  mealInspiration,
  mealPlanDetail,
  bmiCalculator,
  stacionarMenu,
  fortuneWheelPage,
  relaxationList,
  videoList,
  galleryPop
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/auth',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/auth',
        name: Routes.auth.name,
        builder: (context, state) => AuthPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/BmiCalculator',
        name: Routes.bmiCalculator.name,
        builder: (context, state) => BmiCalculator(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/StacionarMenu',
        name: Routes.stacionarMenu.name,
        builder: (context, state) => StacionarMenu(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/FortuneWheelPage',
        name: Routes.fortuneWheelPage.name,
        builder: (context, state) => FortuneWheelPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/mealInspiration',
        name: Routes.mealInspiration.name,
        builder: (context, state) => MealInspiration(
          key: state.pageKey,
        ),
      ),

      GoRoute(
        path: '/RelaxationList',
        name: Routes.relaxationList.name,
        builder: (context, state) => RelaxationPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/VideoList',
        name: Routes.videoList.name,
        builder: (context, state) => VideoPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/mealPlanDetail',
        name: Routes.mealPlanDetail.name,
        pageBuilder: (context, state) {
          final meal = state.extra as Meal;
          return MaterialPage(
            key: state.pageKey,
            child: MealPlanDetail(meal: meal),
          );
        },
      ),
      GoRoute(
        path: '/galleryPop',
        name: Routes.galleryPop.name,
        pageBuilder: (context, state) {
          final heroTag = state.extra as String;
          return MaterialPage(
            key: state.pageKey,
            child: GalleryPop(heroTag: heroTag),
          );
        },
      ),
      // GoRoute(
      //   path: '/detail',
      //   name: Routes.detail.name,
      //   pageBuilder: (context, state) {
      //     final book = state.extra as Book;
      //     return MaterialPage(
      //       key: state.pageKey,
      //       child: DetailPage(book: book),
      //     );
      //   },
      // ),
    ],
  );
}
