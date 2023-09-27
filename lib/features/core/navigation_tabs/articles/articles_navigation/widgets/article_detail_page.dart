import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:stacionar_app/models/article.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';
import 'package:stacionar_app/shared/widgets/contrained_container.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  String _htmlContent = '';

  @override
  void initState() {
    super.initState();
    loadHtmlFromAssets();
  }

  Future<void> loadHtmlFromAssets() async {
    String htmlFile = await rootBundle.loadString('assets/htmls/${widget.article.bodyArticle}');
    setState(() {
      _htmlContent = htmlFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.article.title, style: context.textTheme.titleMedium),
      ),
      body: ConstrainedContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset(widget.article.image),
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
      ),
    );
  }
}
