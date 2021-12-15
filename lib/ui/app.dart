import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'pages/cart_page.dart';
import '../constants/colors.dart';
import 'pages/empty_page.dart';
import 'pages/home_page.dart';

class FurnitureApp extends StatefulWidget {
  const FurnitureApp({Key? key}) : super(key: key);

  @override
  State<FurnitureApp> createState() => _FurnitureAppState();
}

class _FurnitureAppState extends State<FurnitureApp> {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const CartPage(),
      const EmptyPage(),
      const EmptyPage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        activeColorPrimary: kNavigationActiveColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: kNavigattionInactiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart_outlined),
        activeColorPrimary: kNavigationActiveColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: kNavigattionInactiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.star_outline_outlined),
        activeColorPrimary: kNavigationActiveColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: kNavigattionInactiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline_outlined),
        activeColorPrimary: kNavigationActiveColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: kNavigattionInactiveColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView.custom(
      context,
      controller: _controller,
      screens: _buildScreens(),
      confineInSafeArea: true,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      itemCount: _navBarsItems().length,
      customWidget: CustomNavBarWidget(
        items: _navBarsItems(),
        selectedIndex: _controller!.index,
        onItemSelected: (index) {
          setState(() {
            _controller?.index = index;
          });
        },
      ),
    );
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem>
      items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
  final ValueChanged<int> onItemSelected;

  const CustomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: isSelected ? item.activeColorPrimary : Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(14))),
            child: IconTheme(
              data: IconThemeData(
                size: 26.0,
                color: isSelected
                    ? item.activeColorSecondary
                    : item.inactiveColorPrimary,
              ),
              child: item.icon,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          int index = items.indexOf(item);
          return Flexible(
            child: GestureDetector(
              onTap: () {
                onItemSelected(index);
              },
              child: _buildItem(item, selectedIndex == index),
            ),
          );
        }).toList(),
      ),
    );
  }
}
