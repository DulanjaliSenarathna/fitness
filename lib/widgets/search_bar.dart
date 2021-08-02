import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(29.5),
          boxShadow: [BoxShadow(
              offset: Offset(0,17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor
          )]
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search",
            icon: SvgPicture.asset("assets/icons/search.svg"),
            border: InputBorder.none
        ),
      ),
    );
  }
}