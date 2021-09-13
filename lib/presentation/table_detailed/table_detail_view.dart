import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/add_to_cart_response.dart';
import 'package:neostore/data/model/response/rating_response.dart';
import 'package:neostore/data/model/response/table_detail_response.dart';
import 'package:neostore/presentation/my_cart/my_cart_view.dart';
import 'package:neostore/presentation/table_detailed/table_detail_viewmodel.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_elevated_button.dart';
import 'package:neostore/presentation/widget/neostore_textformfield.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class TableDetailView extends BaseClass {
  final int? tableProductDetailed;

  TableDetailView({this.tableProductDetailed});

  @override
  BaseClassState getState() {
    return _TableDetailViewState(tableProductDetailed);
  }
}

class _TableDetailViewState extends BaseClassState {
  var tableProductDetailed;

  TableDetailProvider? _tableDetailProvider;

  TextEditingController _quantityController = new TextEditingController();

  _TableDetailViewState(this.tableProductDetailed);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tableDetailProvider = TableDetailProvider(Provider.of(context));
  }

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return ChangeNotifierProvider<TableDetailProvider>(
      create: (context) => _tableDetailProvider!,
      child: Consumer<TableDetailProvider>(
        builder: (context, model, child) {
          return Scaffold(
            body: _tableDetailProvider?.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            ///top screen widget
                            _topScreen(),

                            ///between screen widget
                            _betweenScreen(
                                _tableDetailProvider?.tableDetailResponse),

                            ///bottom screen widget
                            _bottomScreen(),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  ///widget app bar
  Widget _appBar() {
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
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
      text: _tableDetailProvider?.tableDetailResponse?.data?.name ?? ' ',
      style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!
              .copyWith(color: ColorStyles.white, fontWeight: FontWeight.w400)),
    );
  }

  ///bottom screen widget
  Widget _bottomScreen() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height / 7.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///but now button widget
          _buyNowButton(_tableDetailProvider?.tableDetailResponse),
          SizedBox(
            width: 10,
          ),

          ///rate button widget
          _rateButton(_tableDetailProvider?.ratingResponse),
        ],
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
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: Column(
                      children: [
                        _alertDialogBoxTitle(ratingResponse),
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
                                rating:
                                    ratingResponse?.data?.rating?.toDouble(),
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
                              textStyle: TextStyles.titlelabel?.copyWith(
                                color: ColorStyles.white,
                              ),
                              buttonStyle: TextButton.styleFrom(
                                backgroundColor: ColorStyles.red,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
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

  Widget _alertDialogBoxTitle(RatingResponse? ratingResponse) {
    return NeoStoreTitle(
      maxLine: 1,
      overflow: TextOverflow.ellipsis,
      text: ratingResponse?.data?.name,
      style: TextStyles.titlelabel?.copyWith(
        color: ColorStyles.black,
      ),
    );
  }

  ///but now button widget
  Widget _buyNowButton(TableDetailResponse? tableDetailResponse) {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.6,
        child: NeoStoreElevatedButton(
          onPressed: () {
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: AlertDialog(
                      content: Container(
                        height: MediaQuery.of(context).size.height / 1.7,
                        child: Column(
                          children: [
                            _alertBoxTitle(tableDetailResponse),
                            _alertBoxImage(context, tableDetailResponse),

                            ///enter qty title
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: NeoStoreElevatedButton(
                                    text: ConstantStrings.submit,
                                    textStyle: TextStyles.titlelabel?.copyWith(
                                      color: ColorStyles.white,
                                    ),
                                    buttonStyle: TextButton.styleFrom(
                                      backgroundColor: ColorStyles.red,
                                    ),
                                    onPressed: () async {
                                      if (_quantityController.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: NeoStoreTitle(
                                                text: ConstantStrings
                                                    .please_enter_quantity),
                                          ),
                                        );
                                      } else if (int.parse(
                                              _quantityController.text) >=
                                          8) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: NeoStoreTitle(
                                              text: ConstantStrings
                                                  .enter_less_than_8,
                                            ),
                                          ),
                                        );
                                      } else {
                                        var response =
                                            await _tableDetailProvider
                                                ?.getAddToCart(
                                          int.parse(tableDetailResponse!
                                              .data!.id
                                              .toString()),
                                          int.parse(_quantityController.text),
                                        );
                                        AddToCartResponse? _addToCartResponse =
                                            AddToCartResponse.fromJson(
                                          jsonDecode(response),
                                        );

                                        if (_addToCartResponse.status == 200) {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MyCartView(),
                                            ),
                                          );
                                        } else {}
                                      }
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
          buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.red),
          text: ConstantStrings.buyNow,
          textStyle: TextStyles.titlelabel?.copyWith(
            color: ColorStyles.white,
          ),
        ),
      ),
    );
  }

  ///alert box image
  Widget _alertBoxImage(
      BuildContext context, TableDetailResponse? tableDetailResponse) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: 350,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              tableDetailResponse!.data!.productImages!.first.image.toString(),
            ),
          ),
        ),
      ),
    );
  }

  ///alert box title
  Widget _alertBoxTitle(TableDetailResponse? tableDetailResponse) {
    return NeoStoreTitle(
      maxLine: 1,
      overflow: TextOverflow.ellipsis,
      text: tableDetailResponse?.data?.name,
      style: TextStyles.titlelabel?.copyWith(
        color: ColorStyles.black,
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
              _productName(_tableDetailProvider?.tableDetailResponse),

              ///category name widget
              _categoryName(),

              ///product and rating widget
              _producerAndRating(_tableDetailProvider?.tableDetailResponse)
            ],
          ),
        ),
      ),
    );
  }

  ///between screen widget
  Widget _betweenScreen(TableDetailResponse? tableDetailResponse) {
    return Container(
      color: ColorStyles.light_grey,
      height: MediaQuery.of(context).size.height / 1.5,
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
  Widget _costAndIcon(TableDetailResponse? tableDetailResponse) {
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
  Widget _centerImage(TableDetailResponse? tableDetailResponse) {
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
                tableDetailResponse!.data!.productImages!.first.image!,
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
        style: TextStyles.titleHeadline?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  ///description detail
  Widget _descriptionDetail(TableDetailResponse? tableDetailResponse) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Column(
        children: [
          NeoStoreTitle(
            maxLine: 5,
            text: tableDetailResponse?.data?.description,
            style: TextStyles.labelName,
          ),
        ],
      ),
    );
  }

  ///share icon widget
  Widget _shareIcon() => Icon(Icons.share);

  ///cost widget
  Widget _cost(TableDetailResponse? tableDetailResponse) {
    return NeoStoreTitle(
        text: 'Rs. ${tableDetailResponse?.data?.cost}',
        style: TextStyles.titlelabel);
  }

  ///product and rating widget
  Widget _producerAndRating(TableDetailResponse? tableDetailResponse) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///producer name widget
          _producerName(tableDetailResponse),

          ///rating bar widget
          _ratingBarIndicator(tableDetailResponse?.data?.rating)
        ],
      ),
    );
  }

  ///rating bar widget
  Widget _ratingBarIndicator(int? rating) {
    return RatingBarIndicator(
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: ColorStyles.yellow,
        );
      },
      rating: rating!.toDouble(),
      itemCount: 5,
      itemSize: 15,
      direction: Axis.horizontal,
    );
  }

  ///producer name widget
  Widget _producerName(TableDetailResponse? tableDetailResponse) {
    return NeoStoreTitle(
        text: tableDetailResponse?.data?.producer, style: TextStyles.labelName);
  }

  ///category name widget
  Widget _categoryName() {
    return NeoStoreTitle(
        text: 'Category - Tables', style: TextStyles.titleHeadline);
  }

  ///product name widget
  Widget _productName(TableDetailResponse? tableDetailResponse) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: NeoStoreTitle(
        text: tableDetailResponse?.data?.name,
        style: TextStyles.titlelabel,
      ),
    );
  }

  void fetchTableDetail(int productId) {
    ///get table detail method
    _tableDetailProvider?.getTableDetail(productId);

    ///get rating method
    _tableDetailProvider?.getRating(productId);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      fetchTableDetail(tableProductDetailed);
    });
  }
}
