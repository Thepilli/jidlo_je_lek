import 'package:flutter/material.dart';
import 'package:stacionar_app/app/app_constants.dart';
import 'package:stacionar_app/models/resource_card.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';
import 'package:stacionar_app/shared/widgets/disclaimer_text_widget.dart';
import 'package:stacionar_app/shared/widgets/html_reader_widget.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  final String intro =
      'Ahoj, Dobrý den.\nJmenuji se Jiří a touto cestou bych rád pomohl všem, kteří se - stejně tak jako já - potýkají s nemocí zvanou mentální anorexie, nebo chtějí zjistit více o léčbě poruch příjmu potravy. Po zbytek času si budeme tykat, protože přece jenom je to intimnější téma, a navíc jsme v tom společně jako jedna komunita. Nejsi v tom sama, či sám! Ať už chceš využít jeden z nástrojů aplikace, nebo jen získat více informací jak postupovat s léčbou, věř že je to ten správný krok.\nPo začátku léčby jsem si uvědomil, jak malé, přehlížené, ba dokonce zkreslené, je povědomí o poruchách příjmu potravy a lidech jimi trpícími. A také že není jednoduché najít relevantní informace na jednom místě.\nPostupně jak na aplikaci pracuji, budu doplňovat jednotlivé sekce, ať už jsou to nové články, funkcionality, nebo svůj vlasni příběh.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: context.primary,
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: context.primary,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Column(
                      children: [
                        DisclaimerText(disclaimer: intro),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          label: Text(
            'O mně',
            style: context.textTheme.bodyMedium,
          ),
          icon: const Icon(Icons.info),
        ),
        body: ListView.builder(
          itemCount: resources.length,
          itemBuilder: (BuildContext context, int index) {
            ResourceCard resource = resources[index];
            return ResourceTile(resource: resource);
          },
        ));
  }
}

class ResourceTile extends StatelessWidget {
  const ResourceTile({
    super.key,
    required this.resource,
  });

  final ResourceCard resource;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(jBorderRadius),
          ),
          child: ExpansionTile(
            leading: Image.asset(resource.imagePath, width: 50, height: 50),
            title: Text(
              resource.title,
              style: context.textTheme.bodyMedium?.apply(fontSizeFactor: 1.2, fontWeightDelta: 2),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: HtmlReaderWidget(htmlFilePath: resource.sourcePath),
              ),
              if (resource.extraImages != null)
                SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Image.asset(resource.extraImages!.first), Image.asset(resource.extraImages!.last)],
                  ),
                )
            ],
          ),
        ),
      );
}
