import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({
    super.key,
    required this.title,
    required this.image,
    required this.bodyArticle,
  });

  final String title;
  final String image;
  final String bodyArticle;

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  String _htmlContent = '';

  @override
  void initState() {
    super.initState();
    loadHtmlFromAssets();
  }

  Future<void> loadHtmlFromAssets() async {
    String htmlFile =
        await rootBundle.loadString('assets/htmls/${widget.bodyArticle}');
    setState(() {
      _htmlContent = htmlFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 69, 130, 180),
        title: Text(widget.title,
            style: const TextStyle(color: Colors.white, fontSize: 35)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(widget.image),
              const SizedBox(height: 20),
              HtmlWidget(
                _htmlContent,
                customStylesBuilder: (element) {
                  if (element.localName == 'h1') {
                    return {'color': 'red', 'text-align': 'center'};
                  } else if (element.localName == 'h2') {
                    return {'color': 'red', 'text-align': 'center'};
                  } else {
                    // return null to use the default behavior of HtmlWidget
                    return null;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
