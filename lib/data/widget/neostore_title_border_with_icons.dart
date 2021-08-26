import 'package:flutter/material.dart';
import 'package:neostore/utils/style.dart';

class NeoStoreTitleBorderWithIcons extends StatelessWidget {
  const NeoStoreTitleBorderWithIcons(
      {Key? key, this.text, this.style, this.icon, this.image})
      : super(key: key);

  final String? text;
  final style;
  final icon;
  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 11,
      decoration: BoxDecoration(border: Border.all(color: ColorStyles.white)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Row(
            children: [
              image != null
                  ? Image(
                      image: AssetImage(image),
                      width: 20,
                    )
                  : Icon(
                      icon,
                      color: ColorStyles.white,
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  text!,
                  style: style,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
