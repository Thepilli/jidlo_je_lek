import 'package:flutter/material.dart';

const _levelColors = [
  Color(0xFF00A31D),
  Color(0xFF00CD51),
  Color(0xFFC8E412),
  Color(0xFFF9A500),
  Color(0xFFF95A00),
  Color(0xFFFB464A),
];

Color _scoreRatioToColor(double scoreRatio) =>
    _levelColors[(5 * scoreRatio).round()];

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({super.key});

  @override
  _ScoreWidgetState createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  @override
  Widget build(BuildContext context) {
    final scoreRatio = 1.0;

    final co2EqTonsPerMonth = 20 / 12;
    final scoreToDisplay = co2EqTonsPerMonth;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(36), bottomRight: Radius.circular(36)),
        color: Colors.pink,
      ),
      margin: const EdgeInsets.only(bottom: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 44),
          Padding(
            padding: const EdgeInsets.only(top: 36),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('text', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          Center(
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: CustomPaint(
                      painter: _ScoreArcPainter(scoreRatio),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$scoreToDisplay ',
                          ),
                          TextSpan(text: "text"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreArcPainter extends CustomPainter {
  const _ScoreArcPainter(this.scoreRatio);

  final double scoreRatio;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 25;

    final startPoint = Offset(size.width / 10, size.height / 1.1);
    final controlPoint1 = Offset(size.width / 15, 0);
    final controlPoint2 = Offset(size.width - size.width / 15, 0);
    final endPoint = Offset(size.width - size.width / 10, size.height / 1.1);

    final completePath = Path()
      ..moveTo(startPoint.dx, startPoint.dy)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy);

    final metric = completePath.computeMetrics().first;
    final separatorLength = metric.length / 20;
    final segmentLength = (metric.length - (5 * separatorLength)) / 6;

    final splittedPaths = <Path>[];
    var distance = 0.0;
    while (distance < metric.length) {
      splittedPaths.add(metric.extractPath(distance, distance + segmentLength));
      distance += segmentLength + separatorLength;
    }

    splittedPaths.asMap().forEach((i, path) {
      paint.color = _levelColors[i];
      canvas.drawPath(
        path,
        paint,
      );
    });

    final roundCenter = metric
        .extractPath(metric.length * scoreRatio, metric.length * scoreRatio)
        .getBounds()
        .bottomLeft;
    paint.color = _scoreRatioToColor(scoreRatio);
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(roundCenter, size.width / 20, paint);
    paint.color = Colors.white;
    canvas.drawCircle(roundCenter, size.width / 27, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
