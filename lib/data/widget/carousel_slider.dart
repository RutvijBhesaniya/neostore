import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:neostore/utils/style.dart';

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
      ),
    );

    // Carousel(
    //   images: [
    //     Image.asset(
    //       'assets/images/slider_img1.jpg',
    //       fit: BoxFit.fill,
    //     ),
    //     Image.asset(
    //       'assets/images/slider_img2.jpg',
    //       fit: BoxFit.fill,
    //     ),
    //     Image.asset(
    //       'assets/images/slider_img3.jpg',
    //       fit: BoxFit.fill,
    //     ),
    //     Image.asset(
    //       'assets/images/slider_img4.jpg',
    //       fit: BoxFit.fill,
    //     )
    //   ],
    // ),
  }
}
