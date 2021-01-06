import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildFavouriteCard(context);
        },
      ),
    );
  }

  Widget _buildFavouriteCard(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'JEX/',
                        style: TextStyle(
                          fontSize: _size.width / 26.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'BTC',
                        style: TextStyle(
                          fontSize: _size.width / 28.0,
                          color: Colors.grey.shade200,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.5,
                ),
                Text(
                  'Volume: 72.837',
                  style: TextStyle(
                    fontSize: _size.width / 28.0,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '0.000000031',
                  style: TextStyle(
                    fontSize: _size.width / 28.0,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 8.0, 12.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF00FF80).withOpacity(.15),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    '+3.33%',
                    style: TextStyle(
                      fontSize: _size.width / 30.0,
                      color: Color(0xFF00FF80),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
