import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../model/model.dart';

class ProductListItem1 extends StatelessWidget {
  final Product product;

  const ProductListItem1({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      <Widget>[
        Image.asset(
          product.image,
          height: 155,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Text(
          product.name,
          overflow: TextOverflow.ellipsis,
        ).padding(horizontal: 14, vertical: 5),
        <Widget>[
          Text("\$" + product.price.toString()),
          <Widget>[
            const Icon(
              Icons.star_outlined,
              size: 16,
              color: Color(0xffEEA427),
            ),
            Text(product.rating.toString()),
          ].toRow(
            crossAxisAlignment: CrossAxisAlignment.center,
          )
        ]
            .toRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )
            .padding(horizontal: 14),
      ]
          .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
          .decorated(color: Colors.white)
          .clipRRect(all: 20),
      Positioned(
        top: 10,
        left: 10,
        child: const Icon(
          Icons.favorite_border_outlined,
          size: 18,
          color: Colors.red,
        ).width(30).height(30).decorated(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
      ),
    ]);
  }
}
