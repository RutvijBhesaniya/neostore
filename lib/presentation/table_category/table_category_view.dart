import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/api/entity/table_category_entity.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/model/table_category_item.dart';
import 'package:neostore/presentation/table_category/table_category_viewmodel.dart';
import 'package:neostore/presentation/table_detailed/table_detail_view.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class TableCategoryView extends BaseClass {
  @override
  BaseClassState getState() {
    return _TableCategoryView();
  }
}

class _TableCategoryView extends BaseClassState {
  TableCategoryProvider? _tableCategoryProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tableCategoryProvider = TableCategoryProvider(Provider.of(context));
  }

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return ChangeNotifierProvider<TableCategoryProvider>(
      create: (context) => _tableCategoryProvider!,
      child: Consumer<TableCategoryProvider>(
        builder: (context, model, child) {
          return _tableCategoryProvider?.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _buildListItem(_tableCategoryProvider?.tableCategoryItem);
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
      text: ConstantStrings.tables,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
      style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!
              .copyWith(color: ColorStyles.white, fontWeight: FontWeight.w400)),
    );
  }

  ///list view method
  Widget _buildListItem(tableCategoryItem) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      itemCount: tableCategoryItem.dataItem?.length,
      itemBuilder: (context, index) {
        return listItemDetail(tableCategoryItem, index);
      },
    );
  }

  ///list item
  Widget listItemDetail(TableCategoryItem tableCategoryItem,int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TableDetailView(
                datumItem: tableCategoryItem.dataItem?[index]),
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
                  _image(tableCategoryItem, index),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// title name
                        _titleName(tableCategoryItem, index),

                        /// producer name
                        _titleProducer(tableCategoryItem, index),

                        ///cost and rating
                        _costAndRating(tableCategoryItem, index),
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
  Widget _costAndRating(TableCategoryItem tableCategoryItem, index) {
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
                _cost(tableCategoryItem, index),

                ///rating bar
                _ratingBar(tableCategoryItem, index),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///rating bar widget
  Widget _ratingBar(TableCategoryItem tableCategoryItem, index) {
    return RatingBarIndicator(
      rating: tableCategoryItem.dataItem![index].rating!.toDouble(),
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
  Widget _cost(TableCategoryItem tableCategoryItem, index) {
    return NeoStoreTitle(
      text: 'Rs. ${tableCategoryItem.dataItem![index].cost}',
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.light_red,
      ),
    );
  }

  /// producer name widget
  Widget _titleProducer(TableCategoryItem tableCategoryItem, index) {
    return NeoStoreTitle(
      text: tableCategoryItem.dataItem![index].producer,
      style: TextStyles.subtitle!.copyWith(
        color: ColorStyles.liver_grey,
      ),
    );
  }

  /// title name widget
  Widget _titleName(TableCategoryItem tableCategoryItem, index) {
    return NeoStoreTitle(
      text: tableCategoryItem.dataItem![index].name,
      style: GoogleFonts.workSans(
        textStyle: TextStyles.labelName!.copyWith(
          color: ColorStyles.liver_grey,
        ),
      ),
    );
  }

  ///image widget
  Widget _image(TableCategoryItem tableCategoryItem, index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              tableCategoryItem.dataItem![index].productImages.toString(),
            ),
          ),
        ),
      ),
    );
  }

  ///fetch table data method
  void fetchTableCategoryData(int productCategoryId) {
    _tableCategoryProvider?.getTableCategory(productCategoryId);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      fetchTableCategoryData(1);
    });
  }
}
