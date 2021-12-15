import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'common.dart';
import '../../constants/colors.dart';
import '../../model/model.dart';

class CartItem extends StatefulWidget {
  final Product product;

  const CartItem({
    Key? key,
    required this.product
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int totalItem = 1;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: <Widget>[
        Image.asset(
          widget.product.image,
          height: 120,
          width: 100,
          fit: BoxFit.cover,
        ).clipRRect(all: 20),
        <Widget>[
          Text(widget.product.name)
              .textColor(kTitleColor)
              .fontWeight(FontWeight.w600),
          Text("\$${widget.product.price}")
              .textColor(Color(0xff9A9390))
              .fontSize(20),
          ItemCounter(count: totalItem, onAddTap: () {
            setState(() {
              totalItem += 1;
            });
          }, onRemoveTap: () {
            setState(() {
              if(totalItem == 1){
                return;
              }
              totalItem -= 1;
            });
          })
        ]
            .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween)
            .padding(all: 10)
            .expanded(),
        const Icon(
          Icons.delete_outlined,
          color: Color(0xffDDDDDD),
        )
      ]
          .toRow(
        crossAxisAlignment: CrossAxisAlignment.start,
      )
          .padding(all: 14)
          .decorated(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)))
          .padding(vertical: 8),
    );
  }
}