import 'package:flutter/material.dart';

class RoundedSearchBar extends StatelessWidget {
  const RoundedSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(22)),
        border: Border.all(color: Color(0xffEAEBEC), width: 1),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xffDDDDDD),
          ),
          hintStyle: TextStyle(color: Color(0xffDDDDDD)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 7.5),
        ),
        style: const TextStyle(fontSize: 14, height: 1.8),
        cursorColor: Colors.black,
      ),
    );
  }
}
