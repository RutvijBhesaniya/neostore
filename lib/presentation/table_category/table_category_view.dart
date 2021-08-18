import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/table_category_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_title.dart';
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

  ListView _buildListItem(TableCategoryResponse? tableCategoryResponse) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemCount: tableCategoryResponse!.data!.length,
        itemBuilder: (context, index) {
          return listItem(tableCategoryResponse);
        });
  }

  List<String?> tempList() => ["test", "test"];

  Widget listItem(TableCategoryResponse? tableCategoryResponse) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 7,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  tableCategoryResponse!.data!.first.productImages.toString(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: NeoStoreTitle(
                          text: tableCategoryResponse.data!.first.name,
                          style: TextStyles.labelName!
                              .copyWith(color: ColorStyles.liver_grey),
                        ),
                      ),
                      NeoStoreTitle(
                        text: 'Aron tables',
                        style: TextStyles.subtitle!.copyWith(
                          color: ColorStyles.liver_grey,
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 5,
                            ),
                            child: NeoStoreTitle(
                              text: 'Rs 27390',
                              style: TextStyles.titleHeadline!.copyWith(
                                color: ColorStyles.light_red,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: NeoStoreTitle(
                      text: 'Rating',
                    ),
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
    );
  }

  void fetchTableCategoryData(int productCategoryId) {
    Future.delayed(Duration(milliseconds: 300), () {
      _tableCategoryProvider.getTableCategory(productCategoryId);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTableCategoryData(
        // tableCategoryResponse?.data!.first.productCategoryId!.toInt()
        1
        // tableCategoryResponse.data!.first.productCategoryId!.toInt()
        );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
