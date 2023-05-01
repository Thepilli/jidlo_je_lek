import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:stacionar_app/utils/app_theme.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({
    super.key,
    required this.title,
    required this.image,
    required this.bodyArticle,
  });

  final String title;
  final String image;
  final String bodyArticle;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
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
        actions: [
          IconButton(
            onPressed: () {
              currentTheme.toggleTheme();
            },
            icon: const Icon(Icons.lightbulb_outline),
          )
        ],
        title: Text(
          widget.title,
          style: CustomTheme.h4,
        ),
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
                  switch (element.localName) {
                    case 'a':
                      return {
                        'color': 'rgba(160, 79, 40,255)',
                        'text-align': 'left',
                        'font-size': '100%',
                      };
                    default:
                      return {};
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
