import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final List<String> imgList;

  CarouselWidget(this.imgList);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWidgetState();
  }
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<String> imgList = widget.imgList;
    final double width = MediaQuery.of(context).size.width;
    return Stack(children: [
      CarouselSlider(
        items: imgList
            .map(
              (item) => Center(
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: width,
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
            height: 250,
            viewportFraction: 1.0,
            autoPlay: true,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      carouselSocial(),
      carouselIndicator(imgList, _current),
    ]);
  }
}

Widget carouselSocial() {
  return Positioned(
    left: 20,
    top: 20,
    child: Row(
      children: <Widget>[
        Icon(Icons.share, color: Colors.white),
        SizedBox(width: 16),
        Icon(Icons.star_border, color: Colors.white),
      ],
    ),
  );
}

Widget carouselIndicator(List<String> imgList, int _current) {
  return Positioned(
    left: 20,
    bottom: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.map((url) {
        int index = imgList.indexOf(url);
        return Container(
          width: _current == index ? 16.0 : 8.0,
          height: _current == index ? 16.0 : 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _current == index
                ? Color.fromRGBO(255, 255, 255, 0.9)
                : Color.fromRGBO(255, 255, 255, 0.6),
          ),
        );
      }).toList(),
    ),
  );
}
