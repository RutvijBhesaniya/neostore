import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';

class MyOrderView extends BaseClass {
  @override
  BaseClassState getState() {
    return MyOrderViewState();
  }
}

class MyOrderViewState extends BaseClassState {
  @override
  getAppBar() {
    return _appBar();
  }

  @override
  getBody() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItem();
        },
      ),
    );
  }

  Widget _buildListItem() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NeoStoreTitle(
                  text: 'dssd'
                ),
                NeoStoreTitle(
                  text: 'dssd'
                )
              ],
            ),
            NeoStoreTitle(text: 'sdsds',)
          ],
        ));
  }

  ///appbar widget
  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.purple,
      leading: Icon(
        Icons.arrow_back_ios,
        color: ColorStyles.white,
        size: 20,
      ),
      text: ConstantStrings.editProfile,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }
}
