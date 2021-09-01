import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/add_to_cart_response.dart';
import 'package:neostore/data/model/response/rating_response.dart';
import 'package:neostore/data/model/response/table_detail_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_textformfield.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/my_cart/my_cart_view.dart';
import 'package:neostore/presentation/table_detailed/table_detail_viewmodel.dart';
import 'package:neostore/utils/constant_strings.dart';
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
  late RatingProvider _ratingProvider =
      Provider.of<RatingProvider>(context, listen: false);
  late AddToCartProvider _addToCartProvider =
      Provider.of<AddToCartProvider>(context, listen: false);

  TextEditingController _quantityController = new TextEditingController();

  _TableProductDetailedState(this.tableProductDetailed);

  @override
   getAppBar() {
    // TODO: implement getAppBar
    return _appBar();
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
                  ///top screen widget
                  _topScreen(),

                  ///between screen widget
                  _betweenScreen(_tableDetailProvider.tableDetailResponse),

                  ///bottom screen widget
                  _bottomScreen(),
                ],
              ),
            ),
    );
  }

///appbar
  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.red,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: ColorStyles.white,
          size: 20,
        ),
      ),
      text: ConstantStrings.table,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }


  ///bottom screen widget
  Widget _bottomScreen() {
    return Flexible(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height / 7.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///but now button widget
              _buyNowButton(_tableDetailProvider.tableDetailResponse),
              SizedBox(
                width: 10,
              ),

              ///rate button widget
              _rateButton(_ratingProvider.ratingResponse),
            ],
          ),
        ),
      ),
    );
  }

  ///rate button widget
  Widget _rateButton(RatingResponse? ratingResponse) {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: NeoStoreElevatedButton(
          text: ConstantStrings.rate,
          buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.grey),
          textStyle: TextStyles.titlelabel!.copyWith(
            color: ColorStyles.liver_grey,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Column(
                      children: [
                        NeoStoreTitle(
                          text: ratingResponse!.data!.name,
                          style: TextStyles.titlelabel!.copyWith(
                            color: ColorStyles.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2.7,
                            width: 350,
                            color: Colors.pink,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: RatingBarIndicator(
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star,
                                    color: ColorStyles.yellow,
                                  );
                                },
                                rating: ratingResponse.data!.rating!.toDouble(),
                                itemCount: 5,
                                direction: Axis.horizontal,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            child: NeoStoreElevatedButton(
                              text: ConstantStrings.rateNow,
                              textStyle: TextStyles.titlelabel!.copyWith(
                                color: ColorStyles.white,
                              ),
                              buttonStyle: TextButton.styleFrom(
                                backgroundColor: ColorStyles.red,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  ///but now button widget
  Widget _buyNowButton(TableDetailResponse? tableDetailResponse) {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: NeoStoreElevatedButton(
          onPressed: () {
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Column(
                        children: [
                          NeoStoreTitle(
                            text: tableDetailResponse!.data!.name,
                            style: TextStyles.titlelabel!.copyWith(
                              color: ColorStyles.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2.9,
                              width: 350,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    tableDetailResponse
                                        .data!.productImages!.first.image
                                        .toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ///enter qty title
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: NeoStoreTitle(
                                  text: 'Enter Qty',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Center(
                              child: NeoStoreTextFormField(
                                hintText: 'qty',
                                controller: _quantityController,
                              ),
                            ),
                          ),

                          ///submit button
                          Flexible(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: NeoStoreElevatedButton(
                                  text: ConstantStrings.submit,
                                  textStyle: TextStyles.titlelabel!.copyWith(
                                    color: ColorStyles.white,
                                  ),
                                  buttonStyle: TextButton.styleFrom(
                                    backgroundColor: ColorStyles.red,
                                  ),
                                  onPressed: () async {
                                    var response =
                                        await _addToCartProvider.getAddToCart(
                                      _tableDetailProvider
                                          .tableDetailResponse.data!.id!,
                                      int.parse(_quantityController.text),
                                    );
                                    AddToCartResponse _addToCartResponse =
                                        AddToCartResponse.fromJson(
                                            jsonDecode(response),);
                                    if (_addToCartResponse.status == 200) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyCartView(),
                                        ),
                                      );
                                    } else {
                                      'please';
                                    }
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
          buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.red),
          text: ConstantStrings.buyNow,
          textStyle: TextStyles.titlelabel!.copyWith(
            color: ColorStyles.white,
          ),
        ),
      ),
    );
  }

  ///top screen widget
  Widget _topScreen() {
    return Container(
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
              ///product name widget
              _productName(_tableDetailProvider.tableDetailResponse),

              ///category name widget
              _categoryName(),

              ///product and rating widget
              _producerAndRating(_tableDetailProvider.tableDetailResponse)
            ],
          ),
        ),
      ),
    );
  }

  ///between screen widget
  Widget _betweenScreen(TableDetailResponse tableDetailResponse) {
    return Container(
      color: ColorStyles.light_grey,
      height: MediaQuery.of(context).size.height / 1.7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///cost and icon widget
              _costAndIcon(tableDetailResponse),

              ///image widget
              _centerImage(tableDetailResponse),
              Divider(
                color: ColorStyles.dark_grey,
              ),

              ///description title
              _descriptionTitle(),

              ///description detail
              _descriptionDetail(tableDetailResponse),
            ],
          ),
        ),
      ),
    );
  }

  ///cost and icon widget
  Widget _costAndIcon(TableDetailResponse tableDetailResponse) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///cost widget
          _cost(tableDetailResponse),

          ///share icon widget
          _shareIcon(),
        ],
      ),
    );
  }

  ///image widget
  Widget _centerImage(TableDetailResponse tableDetailResponse) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                tableDetailResponse.data!.productImages!.first.image.toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///description title
  Widget _descriptionTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: NeoStoreTitle(
        text: ConstantStrings.description,
        style: TextStyles.titleHeadline!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  ///description detail
  Widget _descriptionDetail(TableDetailResponse tableDetailResponse) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: NeoStoreTitle(
        maxLine: 5,
        text: tableDetailResponse.data!.description,
        style: TextStyles.labelName,
      ),
    );
  }

  ///share icon widget
  Widget _shareIcon() => Icon(Icons.share);

  ///cost widget
  Widget _cost(TableDetailResponse tableDetailResponse) {
    return NeoStoreTitle(
        text: 'Rs. ${tableDetailResponse.data!.cost}',
        style: TextStyles.titlelabel);
  }

  ///product and rating widget
  Widget _producerAndRating(TableDetailResponse tableDetailResponse) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///producer name widget
          _producerName(tableDetailResponse),

          ///rating bar widget
          _ratingBarIndicator(tableDetailResponse)
        ],
      ),
    );
  }

  ///rating bar widget
  Widget _ratingBarIndicator(TableDetailResponse tableDetailResponse) {
    return RatingBarIndicator(
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: ColorStyles.yellow,
        );
      },
      rating: tableDetailResponse.data!.rating!.toDouble(),
      itemCount: 5,
      itemSize: 15,
      direction: Axis.horizontal,
    );
  }

  ///producer name widget
  Widget _producerName(TableDetailResponse tableDetailResponse) {
    return NeoStoreTitle(
        text: tableDetailResponse.data!.producer, style: TextStyles.labelName);
  }

  ///category name widget
  Widget _categoryName() {
    return NeoStoreTitle(
        text: 'Category - Tables', style: TextStyles.titleHeadline);
  }

  ///product name widget
  Widget _productName(TableDetailResponse tableDetailResponse) {
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
      _ratingProvider.getRating(productId);
      print("fetchtabledetail =>$productId");
    });
  }

  @override
  @override
  void initState() {
    super.initState();
    print("got pproduct id=> $tableProductDetailed");

    fetchTableDetail(tableProductDetailed);
  }



}
