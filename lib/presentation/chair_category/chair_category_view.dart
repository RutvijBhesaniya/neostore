import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';

class ChairCategoryView extends BaseClass{
  @override
  BaseClassState getState() {
    return _ChairCategoryView();
  }

}
class _ChairCategoryView extends BaseClassState{
  @override
  getAppBar() {
    return _appBar();
  }
  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.red,
      leading: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: ColorStyles.white,
          size: 20,
        ),
      ),
      text: ConstantStrings.chairs,
      style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!
              .copyWith(color: ColorStyles.white, fontWeight: FontWeight.w400)),
    );
  }
  @override
  Widget getBody() {
    return Center(child: NeoStoreTitle(text: 'Work in Progress'));
  }
}