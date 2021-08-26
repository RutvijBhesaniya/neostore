import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/add_to_cart_response.dart';
import 'package:neostore/data/model/response/table_detail_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/my_cart/my_cart_viewmodel.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class MyCartView extends BaseClass {
  var tableDetailResponse;
  final int quantity;

  MyCartView(this.tableDetailResponse, this.quantity);

  @override
  BaseClassState getState() {
    return MyCartViewState(tableDetailResponse, quantity);
  }
}

class MyCartViewState extends BaseClassState {
  TableDetailResponse? tableDetailResponse;
  int? quantity;

  MyCartViewState(this.tableDetailResponse, this.quantity);

  late AddToCartProvider _addToCartProvider =
      Provider.of<AddToCartProvider>(context, listen: false);

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return _addToCartProvider.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : _buildListItem(_addToCartProvider.addToCartResponse);
  }

  Widget _buildListItem(AddToCartResponse? addToCartResponse) {
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(tableDetailResponse!
                        .data!.productImages!.first.image
                        .toString()),
                  ),
                ),
              ),
              Column(
                children: [
                  NeoStoreTitle(
                    text: tableDetailResponse!.data!.name,
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
                  child: Icon(Icons.delete),
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

  ///widget app bar
  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.purple,
      leading: Icon(
        Icons.arrow_back_ios,
        color: ColorStyles.white,
        size: 20,
      ),
      text: ConstantStrings.myAccount,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }

  void fetchMyCartData(int productId, int quantity) {
    Future.delayed(
      Duration(milliseconds: 300),
      () {
        _addToCartProvider.getAddToCart(productId, quantity);
      },
    );
  }

  @override
  void initState() {
    fetchMyCartData(tableDetailResponse!.data!.id!, quantity!);
    super.initState();
  }
}
