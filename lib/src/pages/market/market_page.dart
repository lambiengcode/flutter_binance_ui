import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MarketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

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
          indicatorWeight: 2.0,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 28.0),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: _size.width / 26.0,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
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
        color: Color(0xFF000000),
      ),
    );
  }
}
