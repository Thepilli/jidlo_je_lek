import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacionar_app/models/application.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class ApplicationsList extends StatelessWidget {
  const ApplicationsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Application> applications = applicationList;
    String features = 'Tady najdeš aplikace které ti pomohou nebo tě alespoň pobaví při každodenních aktivitách';
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              features,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                endIndent: 30,
                indent: 30,
              ),
              itemCount: applications.length,
              itemBuilder: (BuildContext context, int index) {
                Application application = applications[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                    onTap: () => context.push(application.route),
                    leading: Image.asset(application.imagePath),
                    title: Text(
                      application.title,
                      style: context.textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      application.description,
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
