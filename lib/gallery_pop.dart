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
        body: Container(
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: widget.heroTag,
            child: Image(
              image: AssetImage(widget.heroTag),
            ),
          ),
        ),
      ),
    ));
  }
}
