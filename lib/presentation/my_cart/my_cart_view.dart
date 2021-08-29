import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/delete_cart_response.dart';
import 'package:neostore/data/model/response/list_cart_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/add_address/add_address_view.dart';
import 'package:neostore/presentation/address_list/address_list_view.dart';
import 'package:neostore/presentation/my_cart/my_cart_viewmodel.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class MyCartView extends BaseClass {
  @override
  BaseClassState getState() {
    return MyCartViewState();
  }
}

class MyCartViewState extends BaseClassState {
  late ListCartProvider _listCartProvider =
      Provider.of<ListCartProvider>(context);

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return _listCartProvider.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : _listCartProvider.listCartResponse!.data != null
            ? _buildListItem(_listCartProvider.listCartResponse)
            : Center(
                child: Text('Empty Cart'),
              );
  }

  Widget _buildListItem(ListCartResponse? listCartResponse) {
    return Container(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            itemCount: listCartResponse!.data!.length,
            itemBuilder: (context, index) {
              return _buildListItemDetail(index);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NeoStoreTitle(
                  text: 'Total',
                ),
                NeoStoreTitle(
                    text: _listCartProvider.listCartResponse!.total.toString())
              ],
            ),
          ),
          NeoStoreElevatedButton(
              text: 'OrderNow',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressList(),
                  ),
                );
              })
        ],
      ),
    );
  }

  Widget _buildListItemDetail(int index) {
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
                    image: NetworkImage(
                      _listCartProvider.listCartResponse!.data![index].product!
                          .productImages!,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NeoStoreTitle(
                      text: _listCartProvider
                          .listCartResponse!.data![index].product!.name,
                    ),
                    NeoStoreTitle(
                      text: _listCartProvider.listCartResponse!.data![index]
                          .product!.productCategory,
                    ),
                    // DropdownButton<String>(
                    //   focusColor: Colors.white,
                    //   value: _chosenValue,
                    //   //elevation: 5,
                    //   style: TextStyle(color: Colors.white),
                    //   iconEnabledColor: Colors.black,
                    //   items: <String>[
                    //     'Android',
                    //     'IOS',
                    //     'Flutter',
                    //     'Node',
                    //     'Java',
                    //     'Python',
                    //     'PHP',
                    //   ].map<DropdownMenuItem<String>>(
                    //     (String value) {
                    //       return DropdownMenuItem<String>(
                    //         value: value,
                    //         child: Text(
                    //           value,
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       );
                    //     },
                    //   ).toList(),
                    //   onChanged: (String? value) {
                    //     setState(() {
                    //       _chosenvalue = value;
                    //     });
                    //   },
                    //
                    // ),
                    NeoStoreTitle(
                      text: _listCartProvider
                          .listCartResponse!.data![index].quantity
                          .toString(),
                    )
                  ],
                ),
              ),
              NeoStoreTitle(
                text: _listCartProvider
                    .listCartResponse!.data![index].product!.subTotal
                    .toString(),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () async {
                      var deleteResponse = await _listCartProvider
                          .getDeleteCart(_listCartProvider
                              .listCartResponse!.data![index].productId!);
                      DeleteCartResponse _deleteCartResponse =
                          DeleteCartResponse.fromJson(
                              jsonDecode(deleteResponse));
                      if (_deleteCartResponse.status == 200) {
                        _listCartProvider.getListCart();
                      }
                    },
                    child: Icon(
                      Icons.delete,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: ColorStyles.black,
          ),
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

  void fetchMyCartData() {
    Future.delayed(
      Duration(milliseconds: 300),
      () {
        _listCartProvider.getListCart();
      },
    );
  }

  @override
  void initState() {
    fetchMyCartData();
    super.initState();
  }
}
