import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'category_page.dart';
import '../common/common.dart';
import '../../constants/colors.dart';
import '../../model/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = getCategories().first.title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBGColor,
      appBar: AppBar(
        backgroundColor: kAppBGColor,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset("assets/icons/drawer.png"),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          "Home",
          style: TextStyle(color: kTitleColor),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            color: kTitleColor,
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Find the best furniture")
                .textColor(kTitleColor)
                .fontSize(22)
                .fontWeight(FontWeight.w500)
                .padding(horizontal: 14),
            RoundedSearchBar().padding(all: 14),
            Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TagSelector(
                items: getCategories(),
                selectedItem: selectedCategory,
                onItemClick: (String category) {
                  pushNewScreen(
                    context,
                    screen: CategoryPage(
                      title: category,
                    ),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
            ),
            Text("Popular")
                .fontSize(16)
                .fontWeight(FontWeight.w500)
                .padding(all: 14),
            ListView(
              scrollDirection: Axis.horizontal,
              children: getPopularProducts()
                  .map((product) => ProductListItem2(product: product))
                  .toList(),
            ).height(270).padding(horizontal: 14),
            Text("New Arrivals")
                .fontSize(16)
                .fontWeight(FontWeight.w500)
                .padding(all: 14),
            ListView(
              scrollDirection: Axis.horizontal,
              children: getPopularProducts()
                  .map((product) => ProductListItem3(product: product))
                  .toList(),
            ).height(125).padding(horizontal: 14),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
