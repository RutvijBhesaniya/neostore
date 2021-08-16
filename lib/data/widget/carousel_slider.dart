import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderScreen extends StatelessWidget {
  const CarouselSliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/slider_img1.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/slider_img2.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/slider_img3.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/slider_img4.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ],
      options: CarouselOptions(
          viewportFraction: 1,
          height: MediaQuery.of(context).size.height,
          autoPlay: true,
          onPageChanged: (index, reason) {}),
    );
  }
}

final List<String> imgList = [
  'assets/images/slider_img1.jpg',
  'assets/images/slider_img2.jpg',
  'assets/images/slider_img3.jpg',
  'assets/images/slider_img4.jpg',
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(
              item,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
      ),
    )
    .toList();
