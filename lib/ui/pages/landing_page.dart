import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../app.dart';
import '../common/common.dart';
import '../../constants/colors.dart';
import '../../model/repository.dart';
import 'full_screen_product_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                controller: controller,
                children: getCarouselProducts()
                    .map((product) => FullScreenProductPage(product: product))
                    .toList(),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: SmoothPageIndicator(
                controller: controller, // PageController
                count: getCarouselProducts().length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xff979797),
                  dotColor: Color(0xffE6E6E6),
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
            Positioned(
              top: 35,
              right: 10,
              child: TextButton(
                child: const Text(
                  "Skip",
                  style: TextStyle(color: kTitleColor),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const FurnitureApp()),
                      (Route<dynamic> route) => false);
                },
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: RoundedButton(
                text: "Continue",
                onPress: () {
                  if (controller.page?.toInt() ==
                      getCarouselProducts().length - 1) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const FurnitureApp()),
                        (Route<dynamic> route) => false);
                  }
                  controller.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
