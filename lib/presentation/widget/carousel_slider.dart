import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:neostore/presentation/home/home_viewmodel.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class CarouselSliderScreen extends StatefulWidget {
  const CarouselSliderScreen({Key? key}) : super(key: key);

  @override
  _CarouselSliderScreenState createState() => _CarouselSliderScreenState();
}

class _CarouselSliderScreenState extends State<CarouselSliderScreen> {
  late CarouselSliderProvider _carouselSliderProvider =
      Provider.of<CarouselSliderProvider>(context);

  List<Widget>? imageSliders;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    imageSliders = _carouselSliderProvider.imgList
        .map(
          (item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  image: AssetImage(item),
                ),
              ),
            ),
          ),
        )
        .toList();
    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            viewportFraction: 1,
            height: MediaQuery.of(context).size.height,
            autoPlay: true,
            onPageChanged: (index, reason) {
              _carouselSliderProvider.setIndex(index);
            },
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _carouselSliderProvider.indexList!
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 12),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: e == 1
                                  ? ColorStyles.light_red
                                  : ColorStyles.liver_grey,
                              width: 4),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
