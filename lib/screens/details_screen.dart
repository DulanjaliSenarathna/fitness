import 'package:fitness/constants.dart';
import 'package:fitness/widgets/bottom_nav_bar.dart';
import 'package:fitness/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
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
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth
              )
            ),
          ),
          SafeArea(child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * 0.05,),
                  Text("Medical Tips",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.w900
                  ),
                  ),
                  SizedBox(height: 10,),
                  Text("3-10 MIN Course",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: size.width* .6,
                      child: Text("It’s easy to get confused when it comes to health and nutrition.")
                  ),
                  SizedBox(
                    width: size.width*.5,
                      child: SearchBar()
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: <Widget>[
                      TopicCard(
                        topicNumber: 1,
                        isDone: true,
                        press: (){},
                      ),
                      TopicCard(
                        topicNumber: 2,
                        isDone: true,
                        press: (){},
                      ),
                      TopicCard(
                        topicNumber: 3,
                        isDone: true,
                        press: (){},
                      ),
                      TopicCard(
                        topicNumber: 4,
                        isDone: true,
                        press: (){},
                      ),
                      TopicCard(
                        topicNumber: 5,
                        isDone: true,
                        press: (){},
                      ),
                      TopicCard(
                        topicNumber: 6,
                        isDone: true,
                        press: (){},
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Medical Tips",
                    style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.all(10,),
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [BoxShadow(
                        offset: Offset(0,17),
                        blurRadius: 23,
                        spreadRadius: -23,
                        color: kShadowColor
                      )]
                    ),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/Meditation_women_small.svg"),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Basic 2 ",
                              style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text("Start your practises")
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset("assets/icons/Lock.svg"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
          )
        ],
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  final int topicNumber;
  final bool isDone;
  final Function press;
  const TopicCard({
    Key key, this.topicNumber, this.isDone = false, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context, constraint)
    {
        return ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
            width: constraint.maxWidth/2 - 10,
            //padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: kShadowColor
                )
              ]
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: press,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 42,
                        width: 43,
                        decoration: BoxDecoration(
                          color: isDone ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kBlueColor
                          )
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: isDone?Colors.white: kBlueColor,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                          "Topic $topicNumber",
                        style: Theme.of(context).textTheme.subtitle2,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
