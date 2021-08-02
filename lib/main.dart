import 'package:fitness/constants.dart';
import 'package:fitness/screens/details_screen.dart';
import 'package:fitness/widgets/bottom_nav_bar.dart';
import 'package:fitness/widgets/category_card.dart';
import 'package:fitness/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor)
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"
                )
              )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                      color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg")
                    ),
                  ),
                  Text("Good Morning \nDulanjali",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.w900
                  ),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                      childAspectRatio: .86,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Diet Plan",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: (){},
                        ),
                        CategoryCard(
                          title: "Exercises",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: (){},
                        ),
                        CategoryCard(
                          title: "Medical Tips",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context){
                                  return DetailsScreen();
                            }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Yoga",
                          svgSrc: "assets/icons/yoga.svg",
                          press: (){},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr,title;
  final Function press;
  final bool isActive;
  const BottomNavItem({
    Key key, this.svgScr, this.title, this.press, this.isActive=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset(svgScr,
          color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(title, style: TextStyle(
            color: isActive ? kActiveIconColor : kTextColor
          ),)
        ],
      ),
    );
  }
}



