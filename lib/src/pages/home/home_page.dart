import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:binance/src/models/change.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = new ScrollController();
  StreamController _postsController;
  Timer timer;
  String _api = ''; // Find a API can get Binance Data
  String _option = 'Change';
  bool _showAppBar = true;

  var _current = 0;
  List imgList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq_5VpdtZ8TDPpG1B5E9TAcbCgz1l10joxMw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQksGYjFxzY0ClfferWS3_FA83Sjyd8yhPgCw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJO51rTdGAi2z2z8MkQuhRuLV0RFuAFM42Rw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvy2tSrJ7nPZetcBk9l9zq6bh6okbtR8jJJw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2qyzS6LPb0UaeBjiK_HruTOduID7FSMf1Cg&usqp=CAU',
  ];

  List<String> _notices = [
    'Subcribe Binance JEX Youtube Channel...',
    'Subcribe Binance JEX Facebook Channel...',
    'Subcribe Binance JEX Twitter Channel...',
    'Subcribe Binance JEX Instagram Channel...',
    'Subcribe Binance JEX Gapo Channel...',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  void changePostion(int i) {
    setState(() {
      if (_current == 4 && i == 1) {
        _current = 0;
      } else if (_current == 0 && i == -1) {
        _current = 4;
      } else {
        _current += i;
      }
    });
  }

  Future fetchPost() async {
    final response = await http.get(_api);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  loadPosts() async {
    fetchPost().then((res) async {
      _postsController.add(res);
      print(res['RAW']['PRICE']);
      print('I\'m here');
      return res;
    });
  }

  Future<Null> _handleRefresh() async {
    fetchPost().then((res) async {
      _postsController.add(res);

      return null;
    });
  }

  startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 200), (t) {
      setState(() {
        _handleRefresh();
      });
    });
  }

  @override
  void initState() {
    _postsController = new StreamController();
    loadPosts();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _showAppBar
          ? AppBar(
              elevation: .0,
              backgroundColor: Colors.transparent,
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'BINANCE ',
                      style: TextStyle(
                        fontSize: _size.width / 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'JEX',
                      style: TextStyle(
                        fontSize: _size.width / 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FontAwesomeIcons.user,
                    color: Colors.white,
                    size: _size.width / 22.5,
                  ),
                ),
                SizedBox(
                  width: 6.0,
                ),
              ],
            )
          : null,
      body: Container(
        child: NotificationListener(
          onNotification: (t) {
            if (_controller.position.pixels > _size.height * .025) {
              setState(() {
                _showAppBar = false;
              });
            } else {
              setState(() {
                _showAppBar = true;
              });
            }
            return true;
          },
          child: SingleChildScrollView(
            controller: _controller,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: _size.height * .175,
                      color: Color(0xFFFFD500),
                    ),
                    Container(
                      color: Color(0xFF1e1e1e),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: _size.height * .12,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(4.0, 12.0, 6.0, 14.0),
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: .4,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Icon(
                                      FontAwesomeIcons.bullhorn,
                                      color: Colors.grey.shade400,
                                      size: _size.width / 24.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Padding(
                                      padding: EdgeInsets.only(top: 2.5),
                                      child: Text(
                                        _notices[_current],
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: _size.width / 30.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '12-13',
                                  style: TextStyle(
                                    color: Colors.grey.shade200,
                                    fontSize: _size.width / 28.8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                StreamBuilder(
                                  stream: _postsController.stream,
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return Padding(
                                        padding: EdgeInsets.only(left: 16.0),
                                        child: Row(
                                          children: [
                                            _buildNoticeCoins(
                                              context,
                                              'BTCUSDT',
                                              '+4.56%',
                                              34.3017,
                                              Color(0xFF00FF80),
                                            ),
                                            _buildNoticeCoins(
                                              context,
                                              'ETHUSDT',
                                              '+ 4.56%',
                                              1107.2242,
                                              Color(0xFFFFF3232),
                                            ),
                                            _buildNoticeCoins(
                                              context,
                                              'EOSUSDT',
                                              '+4.56%',
                                              3.0216,
                                              Color(0xFF00FF80),
                                            ),
                                          ],
                                        ),
                                      );
                                    }

                                    return Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Row(
                                        children: [
                                          _buildNoticeCoins(
                                            context,
                                            'BTCUSDT',
                                            '+4.56%',
                                            double.parse(snapshot.data['RAW']
                                                    ['PRICE']
                                                .toString()),
                                            Color(0xFF00FF80),
                                          ),
                                          _buildNoticeCoins(
                                            context,
                                            'ETHUSDT',
                                            '+ 4.56%',
                                            double.parse(snapshot.data['RAW']
                                                    ['PRICE']
                                                .toString()),
                                            Color(0xFFFFF3232),
                                          ),
                                          _buildNoticeCoins(
                                            context,
                                            'EOSUSDT',
                                            '+4.56%',
                                            double.parse(snapshot.data['RAW']
                                                    ['PRICE']
                                                .toString()),
                                            Color(0xFF00FF80),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 18.0,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 12.5),
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 12.0,
                                      ),
                                      _buildQuickAccess(
                                        context,
                                        'Futures Guide',
                                        Feather.alert_octagon,
                                      ),
                                      _buildQuickAccess(
                                        context,
                                        'Insurance',
                                        Feather.shield,
                                      ),
                                      _buildQuickAccess(
                                        context,
                                        'Option\' Guide',
                                        Feather.book_open,
                                      ),
                                      _buildQuickAccess(
                                        context,
                                        'Chat',
                                        Feather.headphones,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                  child: Text(
                                    'Hot Options',
                                    style: TextStyle(
                                      color: Colors.grey.shade50,
                                      fontSize: _size.width / 21.5,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 14.0),
                                      _buildOptionsItem(context, 'Change'),
                                      SizedBox(width: 10.0),
                                      _buildOptionsItem(context, 'Valume'),
                                      SizedBox(width: 10.0),
                                      _buildOptionsItem(context, 'Leverage'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                ...changes.map((item) {
                                  return _buildChangeLine(
                                    context,
                                    item.title,
                                    item.value,
                                    item.percent,
                                    item.increase,
                                  );
                                }).toList(),
                                SizedBox(
                                  height: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: _size.height * .1,
                  left: 0.0,
                  child: Container(
                    margin: EdgeInsets.only(left: 8.0, right: 12.0),
                    height: _size.height * .18,
                    width: _size.width,
                    child: _buildCarouselImage(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoticeCoins(
    context,
    title,
    percent,
    double value,
    color,
  ) {
    final _size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade50,
                  fontSize: _size.width / 28.8,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                percent,
                style: TextStyle(
                  color: color,
                  fontSize: _size.width / 28.8,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.5,
          ),
          Text(
            '$value',
            style: TextStyle(
              color: color,
              fontSize: _size.width / 22.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 2.5,
          ),
          Text(
            '≈ \$${value.round()}',
            style: TextStyle(
              color: color,
              fontSize: _size.width / 24.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccess(context, title, icon) {
    final _size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: _size.width / 16.8,
            color: Color(0xFFFFEA00),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: _size.width / 32.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsItem(context, title) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _option = title;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          color: _option == title ? Colors.grey.shade50 : Colors.grey.shade400,
          fontSize: _option == title ? _size.width / 26.0 : _size.width / 30.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildChangeLine(context, title, value, percent, increase) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: .25,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: _size.width / 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              color: Colors.grey.shade50,
              fontSize: _size.width / 24.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 12.0, 6.0, 12.0),
            decoration: BoxDecoration(
              color: Color(0xFF00FF80).withOpacity(.08),
              borderRadius: BorderRadius.circular(4.0),
            ),
            alignment: Alignment.centerRight,
            child: Text(
              '+$percent%',
              style: TextStyle(
                color: Color(0xFF00FF80),
                fontSize: _size.width / 24.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselImage(context) {
    final _size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: _size.height * .165,
        aspectRatio: 1.5,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
      items: imgList.map((imgUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Row(
              children: [
                Container(
                  height: _size.height * .16,
                  width: _size.width * .7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(imgList[_current]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                  height: _size.height * .165,
                  width: _size.width * .275,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: _current == 4
                          ? NetworkImage(imgList[0])
                          : NetworkImage(imgList[_current + 1]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
