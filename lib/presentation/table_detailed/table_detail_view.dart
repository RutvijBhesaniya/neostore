import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/entity/add_to_cart_entity.dart';
import 'package:neostore/data/api/entity/rating_entity.dart';
import 'package:neostore/data/api/entity/table_detail_entity.dart';
import 'package:neostore/presentation/model/add_to_cart_item.dart';
import 'package:neostore/presentation/model/rating_item.dart';
import 'package:neostore/presentation/model/register_item.dart';
import 'package:neostore/presentation/model/table_category_item.dart';
import 'package:neostore/presentation/model/table_detail_item.dart';
import 'package:neostore/presentation/my_cart/my_cart_view.dart';
import 'package:neostore/presentation/table_detailed/table_detail_viewmodel.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_divider.dart';
import 'package:neostore/presentation/widget/neostore_elevated_button.dart';
import 'package:neostore/presentation/widget/neostore_textformfield.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class TableDetailView extends BaseClass {
  final DatumItem? datumItem;

  TableDetailView({this.datumItem});

  @override
  BaseClassState getState() {
    return _TableDetailViewState(datumItem);
  }
}

class _TableDetailViewState extends BaseClassState {
  DatumItem? datumItem;

  TableDetailProvider? _tableDetailProvider;

  TextEditingController _quantityController = new TextEditingController();

  _TableDetailViewState(this.datumItem);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tableDetailProvider = TableDetailProvider(
      Provider.of(context),
      Provider.of(context),
      Provider.of(context),
    );
  }

  @override
  Widget getAppBar() {
    return _appBar(datumItem?.name);
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
                            _topScreen(_tableDetailProvider?.tableDetailItem),

                            ///between screen widget
                            _betweenScreen(
                                _tableDetailProvider?.tableDetailItem),

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
  Widget _appBar(String? name) {
    return Center(
      child: NeoStoreAppBar(
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
        text: name ?? ' ',
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline?.copyWith(
            color: ColorStyles.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
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
          _buyNowButton(_tableDetailProvider?.tableDetailItem),
          SizedBox(
            width: 10,
          ),

          ///rate button widget
          _rateButton(_tableDetailProvider?.ratingItem),
        ],
      ),
    );
  }

  ///rate button widget
  Widget _rateButton(RatingItem? ratingItem) {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: NeoStoreElevatedButton(
          text: ConstantStrings.rate,
          buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.grey),
          textStyle: TextStyles.titlelabel?.copyWith(
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
                        _alertDialogBoxTitle(ratingItem),
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
                                    ratingItem?.dataItem?.rating?.toDouble(),
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

  Widget _alertDialogBoxTitle(RatingItem? ratingItem) {
    return NeoStoreTitle(
      maxLine: 1,
      overflow: TextOverflow.ellipsis,
      text: ratingItem?.dataItem?.name,
      style: TextStyles.titlelabel?.copyWith(
        color: ColorStyles.black,
      ),
    );
  }

  ///but now button widget
  Widget _buyNowButton(TableDetailItem? tableDetailItem) {
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
                            _alertBoxTitle(tableDetailItem),
                            _alertBoxImage(context, tableDetailItem),

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
                                        Either<AddToCartItem, ApiError>?
                                            response =
                                            await _tableDetailProvider
                                                ?.getAddToCart(
                                          int.parse(tableDetailItem!
                                              .dataItem!.id
                                              .toString()),
                                          int.parse(_quantityController.text),
                                        );

                                        if (response!.isRight) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: NeoStoreTitle(
                                                text: ConstantStrings
                                                    .email_id_already_exist,
                                              ),
                                            ),
                                          );
                                        } else {
                                          AddToCartItem addToCartItem =
                                              response.left;
                                          if (addToCartItem.status == 200) {
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
    BuildContext context,
    TableDetailItem? tableDetailItem,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: 350,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              tableDetailItem!.dataItem!.productImagesItem!.first.image
                  .toString(),
            ),
          ),
        ),
      ),
    );
  }

  ///alert box title
  Widget _alertBoxTitle(TableDetailItem? tableDetailItem) {
    return NeoStoreTitle(
      maxLine: 1,
      overflow: TextOverflow.ellipsis,
      text: tableDetailItem?.dataItem?.name,
      style: TextStyles.titlelabel?.copyWith(
        color: ColorStyles.black,
      ),
    );
  }

  ///top screen widget
  Widget _topScreen(TableDetailItem? tableDetailItem) {
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
              _productName(tableDetailItem),

              ///category name widget
              _categoryName(),

              ///product and rating widget
              _producerAndRating(tableDetailItem)
            ],
          ),
        ),
      ),
    );
  }

  ///between screen widget
  Widget _betweenScreen(TableDetailItem? tableDetailItem) {
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
              _costAndIcon(tableDetailItem),

              ///image widget
              _centerImage(tableDetailItem),

              ///divider
              NeoStoreDivider(
                color: ColorStyles.liver_grey,
              ),

              ///description title
              _descriptionTitle(),

              ///description detail
              _descriptionDetail(tableDetailItem),
            ],
          ),
        ),
      ),
    );
  }

  ///cost and icon widget
  Widget _costAndIcon(TableDetailItem? tableDetailItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///cost widget
          _cost(tableDetailItem),

          ///share icon widget
          _shareIcon(),
        ],
      ),
    );
  }

  ///image widget
  Widget _centerImage(TableDetailItem? tableDetailItem) {
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
                tableDetailItem?.dataItem?.productImagesItem?.first.image ??
                    ' ',
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
  Widget _descriptionDetail(TableDetailItem? tableDetailItem) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Column(
        children: [
          NeoStoreTitle(
            maxLine: 5,
            text: tableDetailItem?.dataItem?.description,
            style: TextStyles.labelName,
          ),
        ],
      ),
    );
  }

  ///share icon widget
  Widget _shareIcon() => Icon(Icons.share);

  ///cost widget
  Widget _cost(TableDetailItem? tableDetailItem) {
    return NeoStoreTitle(
        text: 'Rs. ${tableDetailItem?.dataItem?.cost}',
        style: TextStyles.titlelabel);
  }

  ///product and rating widget
  Widget _producerAndRating(TableDetailItem? tableDetailItem) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///producer name widget
          _producerName(tableDetailItem),

          ///rating bar widget
          _ratingBarIndicator(tableDetailItem)
        ],
      ),
    );
  }

  ///rating bar widget
  Widget _ratingBarIndicator(TableDetailItem? tableDetailItem) {
    return RatingBarIndicator(
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: ColorStyles.yellow,
        );
      },
      rating: tableDetailItem != null
          ? tableDetailItem.dataItem?.rating.toDouble()
          : 0.0,
      itemCount: 5,
      itemSize: 15,
      direction: Axis.horizontal,
    );
  }

  ///producer name widget
  Widget _producerName(TableDetailItem? tableDetailItem) {
    return NeoStoreTitle(
        text: tableDetailItem?.dataItem?.producer, style: TextStyles.labelName);
  }

  ///category name widget
  Widget _categoryName() {
    return NeoStoreTitle(
        text: 'Category - Tables', style: TextStyles.titleHeadline);
  }

  ///product name widget
  Widget _productName(TableDetailItem? tableDetailItem) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: NeoStoreTitle(
        text: tableDetailItem?.dataItem?.name,
        style: TextStyles.titlelabel,
      ),
    );
  }

  void fetchTableDetail(int? productId) {
    ///get table detail method
    _tableDetailProvider?.getTableDetail(productId);

    ///get rating method
    _tableDetailProvider?.getRating(productId!);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchTableDetail(datumItem?.id);
    });
  }
}
