import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'gallery_pop.dart';

class HtmlReaderWidget extends StatelessWidget {
  final String htmlFilePath;

  const HtmlReaderWidget({super.key, required this.htmlFilePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(htmlFilePath),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: HtmlWidget(
                textStyle: Theme.of(context).textTheme.labelLarge,
                snapshot.data!,
                onTapImage: (imageData) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalleryPop(
                        heroTag: imageData.alt.toString(),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
