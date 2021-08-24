import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/table_category_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/product_detailed/table_detail_view.dart';
import 'package:neostore/presentation/table_category/table_category_viewmodel.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class TableCategoryView extends BaseClass {
  @override
  BaseClassState getState() {
    return _TableCategoryView();
  }
}

class _TableCategoryView extends BaseClassState {
  late TableCategoryProvider _tableCategoryProvider =
      Provider.of<TableCategoryProvider>(context);

  @override
  getAppBar() {
    return NeoStoreAppBar(
      text: 'Tables',
    );
  }

  @override
  Widget getBody() {
    return Scaffold(
      body: _tableCategoryProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildListItem(_tableCategoryProvider.tableCategoryResponse),
    );
  }

  ///list view method
  ListView _buildListItem(TableCategoryResponse? tableCategoryResponse) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      itemCount: tableCategoryResponse!.data!.length,
      itemBuilder: (context, index) {
        return listItem(tableCategoryResponse, index);
      },
    );
  }

  ///list item
  Widget listItem(TableCategoryResponse? tableCategoryResponse, index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TableProductDetailed(tableCategoryResponse!.data![index].id),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  ///image
                  _image(tableCategoryResponse!, index),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// title name
                        _titleName(tableCategoryResponse, index),

                        /// producer name
                        _titleProducer(tableCategoryResponse, index),

                        ///cost and rating
                        _costAndRating(tableCategoryResponse, index),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: ColorStyles.dark_grey,
          )
        ],
      ),
    );
  }

  ///cost and rating bar widget
  Widget _costAndRating(TableCategoryResponse tableCategoryResponse, index) {
    return Flexible(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///cost
                _cost(tableCategoryResponse, index),

                ///rating bar
                _ratingBar(tableCategoryResponse, index),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///rating bar widget
  RatingBarIndicator _ratingBar(
      TableCategoryResponse tableCategoryResponse, index) {
    return RatingBarIndicator(
      rating: tableCategoryResponse.data![index].rating!.toDouble(),
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: ColorStyles.yellow,
        );
      },
      itemCount: 5,
      itemSize: 15,
      direction: Axis.horizontal,
    );
  }

  ///cost widget
  Widget _cost(TableCategoryResponse tableCategoryResponse, index) {
    return NeoStoreTitle(
      text: 'Rs. ${tableCategoryResponse.data![index].cost}',
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.light_red,
      ),
    );
  }

  /// producer name widget
  Widget _titleProducer(TableCategoryResponse tableCategoryResponse, index) {
    return NeoStoreTitle(
      text: tableCategoryResponse.data![index].producer,
      style: TextStyles.subtitle!.copyWith(
        color: ColorStyles.liver_grey,
      ),
    );
  }

  /// title name widget
  Widget _titleName(TableCategoryResponse tableCategoryResponse, index) {
    return NeoStoreTitle(
      text: tableCategoryResponse.data![index].name,
      style: TextStyles.labelName!.copyWith(color: ColorStyles.liver_grey),
    );
  }

  ///image widget
  Widget _image(TableCategoryResponse tableCategoryResponse, index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            tableCategoryResponse.data![index].productImages.toString(),
          ),
        )),
      ),
    );
  }

  ///fetch table data method
  void fetchTableCategoryData(int productCategoryId) {
    Future.delayed(Duration(milliseconds: 300), () {
      _tableCategoryProvider.getTableCategory(productCategoryId);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTableCategoryData(1);
  }

  @override
  void dispose() {
    super.dispose();
  }
}