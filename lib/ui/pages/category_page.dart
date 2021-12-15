import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../common/common.dart';
import '../../constants/colors.dart';
import '../../model/repository.dart';

class CategoryPage extends StatefulWidget {
  final String title;

  const CategoryPage({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String selectedCategory = getCategories().first.title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBGColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kTitleColor, //change your color here
        ),
        backgroundColor: kAppBGColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: kTitleColor),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            color: kTitleColor,
            onPressed: () {},
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Discover the most modern ${widget.title}")
                    .textColor(kTitleColor)
                    .fontSize(22)
                    .fontWeight(FontWeight.w500)
                    .padding(right: 50),
                TagSelector(
                  items: getCategories()[1].subCategories!,
                  selectedItem: selectedCategory,
                  onItemClick: (String category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ).height(35).padding(vertical: 14),
                GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.78,
                  crossAxisCount: 2,
                  children: getPopularProducts()
                      .map((product) => ProductListItem1(product: product))
                      .toList(),
                ).flexible(),
              ],
            ),
          );
        },
      ),
    );
  }
}
