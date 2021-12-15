import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../common/common.dart';
import '../../model/model.dart';
import '../../constants/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2F2F2),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(color: Color(0xff4A4543)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outlined),
            color: Color(0xff4A4543),
            onPressed: () => {},
          )
        ],
      ),
      backgroundColor: Color(0xffF2F2F2),
      body: <Widget>[
        ListView(
          children: getPopularProducts()
              .map(
                (product) => CartItem(
                  product: product,
                ),
              )
              .toList(),
        ).flexible(flex: 7),
        <Widget>[
          Text("Order Summary")
              .textColor(kTitleColor)
              .fontSize(16)
              .fontWeight(FontWeight.w600),
          <Widget>[
            Text("Delivery Service").textColor(Color(0xffBBBBBB)),
            Text("\$45")
                .textColor(Color(0xff9A9390))
                .fontSize(20)
                .fontWeight(FontWeight.w600)
          ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
          Container(
            height: 1,
            color: Color(0xffEDEDED),
          ),
          <Widget>[
            Text("TOTAL").textColor(Color(0xffBBBBBB)),
            Text("\$915")
                .textColor(Color(0xff9A9390))
                .fontSize(20)
                .fontWeight(FontWeight.w600)
          ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
        ]
            .toColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween)
            .padding(horizontal: 14, vertical: 8)
            .decorated(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)))
            .padding(vertical: 8)
            .flexible(flex: 2),
        RoundedButton(text: "Pay Now", onPress: () {}).width(double.infinity),
        const SizedBox(
          height: 10,
        )
      ].toColumn().padding(horizontal: 14),
    );
  }
}
