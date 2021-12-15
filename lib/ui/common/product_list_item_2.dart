import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../model/model.dart';
import '../pages/pages.dart';
import '../../constants/colors.dart';

class ProductListItem2 extends StatelessWidget {
  final Product product;

  const ProductListItem2({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      GestureDetector(
        onTap: () {
          pushNewScreen(
            context,
            screen: ProductDetailsPage(product: product,),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Image.asset(
          product.image,
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
        ).clipRRect(all: 20).padding(bottom: 14),
      ),
      <Widget>[
        <Widget>[
          Text(product.name).textColor(kTitleColor).fontWeight(FontWeight.w500),
          Text(product.shortDescription)
              .textColor(Color(0xffBBBBBB))
              .fontSize(12),
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start).expanded(),
        const SizedBox(
          width: 10,
        ),
        Text("\$" + product.price.toString())
            .textColor(Color(0xff9A9390))
            .fontSize(20)
            .fontWeight(FontWeight.w500),
      ].toRow(),
      <Widget>[
        <Widget>[
          const Icon (
            Icons.star_outlined,
            size: 18,
            color: Color(0xffEEA427),
          ),
          const SizedBox(width: 4),
          Text(product.rating.toString()),
        ].toRow(),
        const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ).padding(all: 5).decorated(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ].toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end)
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .padding(all: 14)
        .width(250)
        .decorated(color: Colors.white)
        .clipRRect(all: 20)
        .padding(right: 16);
  }
}
