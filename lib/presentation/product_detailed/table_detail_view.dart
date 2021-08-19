import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/table_detail_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/product_detailed/table_detail_viewmodel.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class TableProductDetailed extends BaseClass {
  var tableProductDetailed;

  TableProductDetailed(this.tableProductDetailed);

  @override
  BaseClassState getState() {
    return _TableProductDetailedState(tableProductDetailed);
  }
}

class _TableProductDetailedState extends BaseClassState {
  var tableProductDetailed;
  late TableDetailProvider _tableDetailProvider =
      Provider.of<TableDetailProvider>(context);

  _TableProductDetailedState(this.tableProductDetailed);

  @override
  AppBar? getAppBar() {
    // TODO: implement getAppBar
    return NeoStoreAppBar(
      text: 'dd',
    );
  }

  @override
  Widget getBody() {
    return Scaffold(
      body: _tableDetailProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  Container(
                    color: ColorStyles.grey,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 7,
                    child: Container(
                      color: ColorStyles.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _productName(
                                _tableDetailProvider.tableDetailResponse),
                            NeoStoreTitle(
                                text: '6 Seater Tale for family',
                                style: TextStyles.titleHeadline),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  NeoStoreTitle(
                                      text: '6 Seater Tale for family',
                                      style: TextStyles.labelName),
                                  NeoStoreTitle(
                                      text: '6 Seater Tale for family',
                                      style: TextStyles.labelName),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: ColorStyles.light_grey,
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  NeoStoreTitle(
                                      text: 'Rs 27,390',
                                      style: TextStyles.titlelabel),
                                  Icon(Icons.share)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  color: ColorStyles.yellow,
                                ),
                              ),
                            ),
                            Divider(
                              color: ColorStyles.dark_grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: NeoStoreTitle(
                                text: 'Description',
                                style: TextStyles.titleHeadline!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: NeoStoreTitle(
                                maxLine: 5,
                                text:
                                    'Mild Steel Base In Poder Coated White Finish.8 mm Tempered Glass Table Top.Bottom Shelf In Paimted BrownGlass',
                                style: TextStyles.labelName,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height / 7.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: NeoStoreElevatedButton(
                                  buttonStyle: TextButton.styleFrom(
                                      backgroundColor: ColorStyles.red),
                                  text: 'BUY NOW',
                                  textStyle: TextStyles.titlelabel!.copyWith(
                                    color: ColorStyles.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: NeoStoreElevatedButton(
                                  text: 'RATE',
                                  buttonStyle: TextButton.styleFrom(
                                      backgroundColor: ColorStyles.grey),
                                  textStyle: TextStyles.titlelabel!.copyWith(
                                    color: ColorStyles.liver_grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Padding _productName(TableDetailResponse tableDetailResponse) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: NeoStoreTitle(
        text: tableDetailResponse.data!.name,
        style: TextStyles.titlelabel,
      ),
    );
  }

  void fetchTableDetail(int productId) {
    Future.delayed(Duration(milliseconds: 300), () {
      _tableDetailProvider.getTableDetail(productId);
      print("fetchtabledetail =>${productId}");
    });
  }

  @override
  void initState() {
    super.initState();
    print("got pproduct id=> ${tableProductDetailed}");

    fetchTableDetail(tableProductDetailed);
  }
}
