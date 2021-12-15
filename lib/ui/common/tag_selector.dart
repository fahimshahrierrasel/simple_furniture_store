import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../model/model.dart';

class TagSelector extends StatelessWidget {
  final List<ProductCategory> items;
  final String selectedItem;
  final Function onItemClick;

  const TagSelector({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: items
          .map(
            (item) => Container(
              margin: EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => onItemClick(item.title),
                child: Chip(
                  avatar: item.icon != null
                      ? Image.asset(
                          item.icon!,
                          height: 24,
                          color: item.title == selectedItem
                              ? Colors.white
                              : Color(0xff979797),
                        )
                      : null,
                  label: Text(item.title),
                  backgroundColor: item.title == selectedItem
                      ? Color(0xff9A9390)
                      : Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  labelPadding: EdgeInsets.only(
                      left: item.icon != null ? 0 : 5, right: 5),
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color:
                        item.title == selectedItem ? Colors.white : kTitleColor,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
