import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/configuration.dart';
import 'package:travel_ui/models/recommended_model.dart';
import 'package:travel_ui/widgets/custom_button.dart';
import 'package:travel_ui/widgets/rounded_rectangle_tab_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(
    viewportFraction: 0.877,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            physics: BouncingScrollPhysics(),
            children: [],
          ),
          //Top navigation bar icons here
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  icon: Icon(CupertinoIcons.line_horizontal_3),
                ),
                CustomButton(
                  icon: Icon(CupertinoIcons.search),
                ),
              ],
            ),
          ),
          ListView(
            physics: BouncingScrollPhysics(),
            children: [
              //Title text
              Padding(
                padding: EdgeInsets.only(
                  top: 100,
                  left: 28.8,
                ),
                child: Text(
                  'Explore \nthe Nature',
                  style: TextStyle(
                    fontSize: 45.6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //custom tab bar with custom indicator
              Container(
                height: 30,
                margin: EdgeInsets.only(
                  left: 14.4,
                  top: 28.8,
                ),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    physics: BouncingScrollPhysics(),
                    labelPadding: EdgeInsets.symmetric(horizontal: 14.4),
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 14.4),
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey[400],
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    indicator: RoundedRectangleTabIndicator(
                      color: Colors.black,
                      weight: 4,
                      width: 12,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          child: Text('Recommended'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text('Popular'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text('New Destinations'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text('Hidden Gems'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Recommended section
              //TODO: make other sections too using TabView
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 298.4,
                // color: Colors.red,
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendations.length,
                    (index) => Container(
                      margin: EdgeInsets.only(right: 20, top: 20, bottom: 40),
                      height: 298.4,
                      width: 333.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: customShadow,
                        image: DecorationImage(
                          image: NetworkImage(
                            recommendationsData[index]['image'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 15,
                            left: 15,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 19.2,
                                  sigmaY: 19.2,
                                ),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 36,
                                  padding: EdgeInsets.only(
                                    left: 16.72,
                                    right: 14.4,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.map_pin_ellipse,
                                        color: Colors.white,
                                        size: 19,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        recommendationsData[index]['name'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Dot Indicator using smoothPageIndicator
              Container(
                margin: EdgeInsets.only(left: 20),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 5,
                  effect: WormEffect(
                    activeDotColor: Colors.black87,
                    dotColor: Colors.grey[400],
                    dotHeight: 6.5,
                    dotWidth: 6.5,
                    spacing: 5,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
