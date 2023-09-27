import 'package:flutter/material.dart';

class GalleryPop extends StatefulWidget {
  final String heroTag;
  const GalleryPop({super.key, required this.heroTag});

  @override
  State<GalleryPop> createState() => _GaleryPopState();
}

class _GaleryPopState extends State<GalleryPop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: widget.heroTag,
            child: Dismissible(
              direction: DismissDirection.vertical,
              key: const Key('key'),
              onDismissed: (_) => Navigator.of(context).pop(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  image: AssetImage(widget.heroTag),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
