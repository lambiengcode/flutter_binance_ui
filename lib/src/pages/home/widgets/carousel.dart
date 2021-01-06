import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  var _current = 0;
  List imgList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq_5VpdtZ8TDPpG1B5E9TAcbCgz1l10joxMw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQksGYjFxzY0ClfferWS3_FA83Sjyd8yhPgCw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJO51rTdGAi2z2z8MkQuhRuLV0RFuAFM42Rw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvy2tSrJ7nPZetcBk9l9zq6bh6okbtR8jJJw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2qyzS6LPb0UaeBjiK_HruTOduID7FSMf1Cg&usqp=CAU',
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

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: _size.height * .165,
          aspectRatio: 1.5,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 10),
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
      ),
    );
  }
}
