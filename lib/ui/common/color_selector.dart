import 'package:flutter/material.dart';

import '../../model/model.dart';


class ColorSelector extends StatelessWidget {
  final List<ColorSelectorItem> items;

  const ColorSelector({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.map((item) {
        return Container(
          width: 35,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: item.color),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FractionallySizedBox(
              heightFactor: 0.9, // Adjust those two for the white space
              widthFactor: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}