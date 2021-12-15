import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class TicketPainter extends CustomPainter {
  final String title;
  final String subTitle;
  final bool isFlipped;

  TicketPainter(
      {required this.title, required this.subTitle, this.isFlipped = false});

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = kTitleColor;
    canvas.drawLine(Offset.zero, Offset(0, -size.height * 0.5), linePaint);

    Paint outerCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withOpacity(0.65);
    canvas.drawCircle(Offset.zero, size.height * 0.15, outerCirclePaint);

    Paint innerCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = kTitleColor;
    canvas.drawCircle(Offset.zero, size.height * 0.07, innerCirclePaint);

    Paint rectanglePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(
          isFlipped ? size.width * 0.1 : -size.width * 0.1,
          -size.height * 0.9,
          isFlipped ? -size.width : size.width,
          size.height * 0.6,
        ),
        bottomRight: Radius.circular(size.width * 0.12),
        bottomLeft: Radius.circular(size.width * 0.12),
        topLeft: Radius.circular(size.width * 0.12),
        topRight: Radius.circular(size.width * 0.12),
      ),
      rectanglePaint,
    );

    final titlePainter = TextPainter(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          color: const Color(0xffBBBBBB),
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    titlePainter.layout(minWidth: 0, maxWidth: size.width * 0.8);

    var titleOffset = Offset(
        ((size.width - titlePainter.width) * 0.5 - size.width * 0.1),
        -size.height * 0.8);
    if (isFlipped) {
      titleOffset = Offset(
          ((-size.width - titlePainter.width) * 0.5 + size.width * 0.1),
          -size.height * 0.8);
    }

    titlePainter.paint(canvas, titleOffset);

    final subTitlePainter = TextPainter(
      text: TextSpan(
        text: "\$${subTitle}",
        style: const TextStyle(
          color: kTitleColor,
          fontSize: 18,
          letterSpacing: 1.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    subTitlePainter.layout(minWidth: 0, maxWidth: size.width * 0.8);

    var subTitleOffset = Offset(
        ((size.width - subTitlePainter.width) * 0.5 - size.width * 0.1),
        -size.height * 0.6);

    if(isFlipped){
      subTitleOffset = Offset(
          ((-size.width - subTitlePainter.width) * 0.5 + size.width * 0.1),
          -size.height * 0.6);
    }
    subTitlePainter.paint(canvas, subTitleOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
