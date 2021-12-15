import 'package:flutter/material.dart';

import '../../model/product.dart';
import '../common/common.dart';

class FullScreenProductPage extends StatelessWidget {
  final CarouselProduct product;

  const FullScreenProductPage({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: product.offset.dy,
          left: product.offset.dx,
          child: CustomPaint(
            size: const Size(150, 100),
            painter: TicketPainter(
                title: product.name.split(" ").take(2).join(" "),
                subTitle: product.price.toString(),
                isFlipped: product.isFlipped),
          ),
        ),

      ],
    );
  }
}
