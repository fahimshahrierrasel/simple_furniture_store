import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class ItemCounter extends StatelessWidget {
  final int count;
  final Function onAddTap;
  final Function onRemoveTap;

  const ItemCounter({
    Key? key,
    required this.count,
    required this.onAddTap,
    required this.onRemoveTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      GestureDetector(
        onTap: () => onRemoveTap(),
        child: Icon(
          Icons.remove_outlined,
          color: Color(0xff9A9390),
        ),
      ),
      Text(count.toString())
          .textAlignment(TextAlign.center)
          .center()
          .backgroundColor(Color(0xffEAEBEC))
          .width(30)
          .height(30),
      GestureDetector(
        onTap: () => onAddTap(),
        child: Icon(
          Icons.add_outlined,
          color: Color(0xff9A9390),
        ),
      ),
    ]
        .toRow(mainAxisAlignment: MainAxisAlignment.center)
        .decorated(
          border: Border.all(color: Color(0xffEAEBEC), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        )
        .width(90)
        .height(30);
  }
}
