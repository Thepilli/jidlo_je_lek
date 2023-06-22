import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:stacionar_app/constants/colors.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({
    Key? key,
    required this.title,
    required this.image,
    required this.bodyArticle,
  }) : super(key: key);

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
    String htmlFile = await rootBundle.loadString('assets/htmls/${widget.bodyArticle}');
    setState(() {
      _htmlContent = htmlFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Get.isDarkMode;
    var iconColor = isDark ? jPrimaryDarkColor : jPrimaryLightColor;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        backgroundColor: iconColor,
        actions: const [],
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black54),
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
