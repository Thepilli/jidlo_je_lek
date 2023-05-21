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
            child: InteractiveViewer(
              clipBehavior: Clip.none,
              child: Image(
                image: AssetImage(widget.heroTag),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

class InkwellPop extends StatelessWidget {
  final String imgPath;

  const InkwellPop({
    super.key,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GalleryPop(
              heroTag: imgPath,
            ),
          ),
        );
      },
      child: Hero(
        tag: imgPath,
        child: Image(
          image: AssetImage(imgPath),
          width: 150,
        ),
      ),
    );
  }
}
