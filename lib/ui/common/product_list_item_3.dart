import 'package:demo_furniture_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../model/model.dart';
import '../pages/pages.dart';

class ProductListItem3 extends StatelessWidget {
  final Product product;

  const ProductListItem3({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Image.asset(
        product.image,
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ).clipRRect(all: 20),
      const SizedBox(
        width: 12,
      ),
      <Widget>[
        Text(
          product.name,
          overflow: TextOverflow.fade,
        ).textColor(kTitleColor).fontWeight(FontWeight.w500).flexible(),
        Text(product.category).textColor(Color(0xffBBBBBB)).fontSize(12),
        const SizedBox(
          height: 12,
        ),
        Text("\$" + product.price.toString())
            .textColor(Color(0xff9A9390))
            .fontSize(20)
            .fontWeight(FontWeight.w500),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
          )
          .flexible(),
    ]
        .toRow(
          crossAxisAlignment: CrossAxisAlignment.center,
        )
        .padding(all: 14)
        .width(250)
        .decorated(color: Colors.white)
        .clipRRect(all: 20)
        .gestures(onTap: () {
      pushNewScreen(
        context,
        screen: ProductDetailsPage(
          product: product,
        ),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }).padding(right: 16);
  }
}
