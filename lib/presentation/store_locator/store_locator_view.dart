import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';

class StoreLocator extends BaseClass {
  @override
  BaseClassState getState() {
    return _StoreLocatorState();
  }
}

class _StoreLocatorState extends BaseClassState {

  @override
  getAppBar() {
    return _appBar();
  }


  @override
  Widget getBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/storelocator.png'),
        ),
      ),
    );
  }

  ///widget app bar
  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.red,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: ColorStyles.white,
          size: 20,
        ),
      ),
      text: ConstantStrings.storeLocator,
      style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!
              .copyWith(color: ColorStyles.white, fontWeight: FontWeight.w600)),
    );
  }
}
