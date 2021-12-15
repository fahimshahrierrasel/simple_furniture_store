import 'package:demo_furniture_app/ui/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'constants/colors.dart';
import 'ui/pages/cart_page.dart';
import 'ui/pages/empty_page.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo Furniture Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .copyWith(
            headline6: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(letterSpacing: 1.0),
            subtitle1: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(letterSpacing: 1.0),
            subtitle2: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(letterSpacing: 1.0),
            bodyText1: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(letterSpacing: 1.0),
            bodyText2: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(letterSpacing: 1.0),
            button: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(letterSpacing: 1.0),
          ),
        ),
        home: const LandingPage());
  }
}


