import 'package:binance/src/pages/market/pages/favourite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MarketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  var _pages = [
    FavouritePage(),
    FavouritePage(),
    FavouritePage(),
    FavouritePage(),
    FavouritePage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        brightness: Brightness.dark,
        elevation: .0,
        backgroundColor: Color(0xFF1e1e1e).withOpacity(.98),
        title: Text(
          'Market',
          style: TextStyle(
            fontSize: _size.width / 16.0,
            color: Colors.grey.shade100,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.search,
              color: Colors.grey.shade100,
              size: _size.width / 16.0,
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          labelColor: Color(0xFFFFD500),
          indicatorColor: Color(0xFFFFD500),
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1.75,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 28.0),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: _size.width / 28.0,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: _size.width / 28.0,
          ),
          tabs: [
            Container(
              width: _size.width * .2,
              child: Tab(
                text: 'Favourites',
              ),
            ),
            Container(
              width: _size.width * .15,
              child: Tab(
                text: 'Cross',
              ),
            ),
            Container(
              width: _size.width * .15,
              child: Tab(
                text: 'Isolated',
              ),
            ),
            Container(
              width: _size.width * .15,
              child: Tab(
                text: 'Options',
              ),
            ),
            Container(
              width: _size.width * .15,
              child: Tab(
                text: 'BTC',
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFF141414),
        child: Column(
          children: [
            SizedBox(
              height: 2.5,
            ),
            _buildTopBar(context),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _pages.map((Widget tab) {
                  return tab;
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Pairs',
              style: TextStyle(
                fontSize: _size.width / 26.0,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Last Price',
                  style: TextStyle(
                    fontSize: _size.width / 30.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Icon(
                  FontAwesomeIcons.sort,
                  color: Colors.grey.shade400,
                  size: _size.width / 26.0,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Change',
                  style: TextStyle(
                    fontSize: _size.width / 30.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Icon(
                  FontAwesomeIcons.sort,
                  color: Colors.grey.shade400,
                  size: _size.width / 26.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
