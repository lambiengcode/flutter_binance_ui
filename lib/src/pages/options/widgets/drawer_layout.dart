import 'package:binance/src/data/type_coin.dart';
import 'package:flutter/material.dart';

class DrawerLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DrawerLayoutState();
}

class _DrawerLayoutState extends State<DrawerLayout>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<String> _listData = [];

  @override
  void initState() {
    super.initState();
    _listData.addAll(btcs);
    _tabController = new TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xFF1e1e1e),
      child: ListView(
        children: [
          SizedBox(
            height: _size.height / 30.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              'Options',
              style: TextStyle(
                color: Colors.grey.shade50,
                fontSize: _size.width / 24.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 4.0),
          Container(
            child: TabBar(
              onTap: (index) {
                setState(() {
                  _listData.clear();
                  if (index % 2 == 0) {
                    _listData.addAll(btcs);
                  } else {
                    _listData.addAll(eths);
                  }
                });
              },
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
                  width: _size.width * .1,
                  child: Tab(
                    text: 'BTC',
                  ),
                ),
                Container(
                  width: _size.width * .1,
                  child: Tab(
                    text: 'ETH',
                  ),
                ),
                Container(
                  width: _size.width * .1,
                  child: Tab(
                    text: 'EOS',
                  ),
                ),
                Container(
                  width: _size.width * .1,
                  child: Tab(
                    text: 'CTC',
                  ),
                ),
                Container(
                  width: _size.width * .1,
                  child: Tab(
                    text: 'BNB',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.0),
          ..._listData
              .map(
                (item) => Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 16.0),
                  child: Row(
                    children: [
                      Text(
                        item,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _size.width / 23.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
