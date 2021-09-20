import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';

class CupboardCategoryView extends BaseClass {
  @override
  BaseClassState getState() {
    return _CupboardCategoryView();
  }
}

class _CupboardCategoryView extends BaseClassState {
  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return Center(
      child: NeoStoreTitle(
        text: ConstantStrings.dataNotFound,
      ),
    );
  }

  Widget _appBar() {
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
      text: ConstantStrings.cupboards,
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
