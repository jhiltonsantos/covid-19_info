import 'package:covidinfo/colors.dart';
import 'package:covidinfo/pages/page_about.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:covidinfo/pages/page_brazil.dart';
import 'package:covidinfo/pages/page_world.dart';
import 'package:covidinfo/pages/page_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          //PAGES
          children: <Widget>[
            Center(
              child: buildPageWorld(),
            ),
           Center(
                child: buildPageBrazil(),

            ),
            Center(
              child: buildPageNews(),
            ),
            Center(
              child: buildPageAbout(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          backgroundColor: darkPrimaryText,
          showElevation: true,
          itemCornerRadius: 8,
          curve: Curves.easeInBack,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 100), curve: Curves.ease);
            });
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.globeAmericas),
              title: Text('Mundo'),
              activeColor: Colors.redAccent[100],
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.solidFlag),
              title: Text('Brasil'),
              activeColor: Colors.yellow[400],
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.solidNewspaper),
              title: Text('Notícias'),
              activeColor: Colors.lightGreenAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(MdiIcons.information),
              title: Text('Sobre'),
              activeColor: Colors.blue[300],
              textAlign: TextAlign.center,
            )
          ]),
    );
  }
}
