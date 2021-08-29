import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';

class OrderDetailView extends BaseClass{
  @override
  BaseClassState getState() {
    return OrderDetailViewState();
  }
}
class OrderDetailViewState extends BaseClassState{

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  getBody(){
    return _buildListItem();
  }

  Widget _buildListItem() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItemDetail();
        },
      ),
    );
  }

  Widget _buildListItemDetail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3.5,
                height: MediaQuery.of(context).size.height / 7,
                color: ColorStyles.purple,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: NetworkImage(tableDetailResponse!
                //         .data!.productImages!.first.image
                //         .toString()),
                //   ),
                // ),
              ),
              Column(
                children: [
                  NeoStoreTitle(
                    text: 'dsdsdsd',
                  ),
                  NeoStoreTitle(
                    text: 'asasass',
                  ),
                  NeoStoreTitle(
                    text: 'asasass',
                  )
                ],
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: NeoStoreTitle(text: 'dsdsds',)
                ),
              ),
            ],
          ),
          Divider(
            color: ColorStyles.black,
          )
        ],
      ),
    );
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
