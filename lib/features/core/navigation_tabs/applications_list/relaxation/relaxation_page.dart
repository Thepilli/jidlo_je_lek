import 'package:flutter/material.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/relaxation/relaxation_detail.dart';
import 'package:stacionar_app/models/relaxation.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class RelaxationPage extends StatelessWidget {
  const RelaxationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 100,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Vyber si relaxaci která ti nejvíce vyhovuje.',
                  style: context.textTheme.bodySmall,
                ),
              )),
          SliverList.builder(
            itemCount: relaxationList.length,
            itemBuilder: (context, index) {
              Relaxation relaxation = relaxationList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    tileColor: context.primary.withOpacity(.6),
                    title: Text(relaxation.tileTitle, style: context.textTheme.bodyMedium),
                    leading: Image.asset(relaxation.tileAsset),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RelaxationDetail(
                            relaxation: relaxation,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
