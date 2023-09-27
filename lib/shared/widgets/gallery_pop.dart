import 'package:flutter/material.dart';
import 'package:stacionar_app/shared/widgets/contrained_container.dart';

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
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: Colors.greenAccent.withOpacity(0.5),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(244, 233, 215, 1),
      body: ConstrainedContainer(
        child: Center(
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
        ),
      ),
    );
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
