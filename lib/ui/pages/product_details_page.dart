import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../common/common.dart';
import '../../constants/colors.dart';
import '../../model/model.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kTitleColor, //change your color here
        ),
        backgroundColor: kAppBGColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Detail",
          style: TextStyle(color: kTitleColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            color: kTitleColor,
            onPressed: () => {},
          )
        ],
      ),
      body: Container(
        color: kAppBGColor,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                height: context.heightPct(0.45),
                width: context.widthPct(0.75),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(product.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 30,
                width: double.infinity,
                child: ColorSelector(
                  items: [
                    ColorSelectorItem(value: "red", color: Colors.red),
                    ColorSelectorItem(value: "green", color: Colors.green),
                    ColorSelectorItem(value: "blue", color: Colors.blue),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 14, right: 14, bottom: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 5,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: const BoxDecoration(
                        color: Color(0xff979797),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: kTitleColor,
                              ),
                            ),
                            Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                  fontSize: 26, color: Color(0xff9A9390)),
                            ),
                            RatingBar.builder(
                              initialRating: product.rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              unratedColor: Color(0xffDDDDDD),
                              itemPadding: EdgeInsets.symmetric(vertical: 5.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Color(0xffEEA427),
                              ),
                              onRatingUpdate: (r) {},
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Color(0xffF6F6F6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            color: Color(0xffEE3127),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        product.description,
                        style: const TextStyle(color: Color(0xffADADAD)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 12, top: 8, left: 16, right: 16),
                color: Colors.white,
                width: double.infinity,
                child: RoundedButton(
                  text: "Add to cart",
                  onPress: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
