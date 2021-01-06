import 'package:binance/src/pages/home/home_page.dart';
import 'package:binance/src/pages/market/market_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPage = 0;
  var _pages = [
    HomePage(),
    MarketPage(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: .0,
          backgroundColor: Color(0xFF1e1e1e).withOpacity(.98),
          currentIndex: currentPage,
          onTap: (i) {
            setState(() {
              currentPage = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: _size.width / 15.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xFFFFD500),
          unselectedItemColor: Colors.grey.shade400,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Feather.home), title: Text("Dashboard")),
            BottomNavigationBarItem(
                icon: Icon(Feather.bar_chart_2), title: Text("Activity")),
            BottomNavigationBarItem(
                icon: Icon(Feather.trending_down), title: Text("Trend")),
            BottomNavigationBarItem(
                icon: Icon(Feather.trending_up), title: Text("Trend")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.trello), title: Text("Coins")),
          ],
        ),
        body: _pages[currentPage],
      ),
    );
  }
}
