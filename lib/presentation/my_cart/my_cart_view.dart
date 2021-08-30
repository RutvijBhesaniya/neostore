import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/add_to_cart_response.dart';
import 'package:neostore/data/model/response/delete_cart_response.dart';
import 'package:neostore/data/model/response/list_cart_response.dart';
import 'package:neostore/data/model/response/table_detail_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_textformfield.dart';
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
  TextEditingController _quantityController = new TextEditingController();

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
            ? _buildListItem(_listCartProvider.listCartResponse,
                _listCartProvider.tableDetailResponse,_listCartProvider.addToCartResponse)
            : Center(
                child: Text('Empty Cart'),
              );
  }

  Widget _buildListItem(ListCartResponse? listCartResponse,
      TableDetailResponse? tableDetailResponse,AddToCartResponse? addToCartResponse) {
    return Container(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            itemCount: listCartResponse!.data!.length,
            itemBuilder: (context, index) {
              return _buildListItemDetail(index, tableDetailResponse,addToCartResponse);
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

  Widget _buildListItemDetail(
      int index, TableDetailResponse? tableDetailResponse, AddToCartResponse? addToCartResponse) {
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
                    // GestureDetector(
                    //   onTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           content: Container(
                    //             height:
                    //                 MediaQuery.of(context).size.height / 1.5,
                    //             child: Column(
                    //               children: [
                    //                 NeoStoreTitle(
                    //                   text: tableDetailResponse!.data!.name,
                    //                   style: TextStyles.titlelabel!.copyWith(
                    //                     color: ColorStyles.black,
                    //                   ),
                    //                 ),
                    //                 Padding(
                    //                   padding: const EdgeInsets.symmetric(
                    //                       vertical: 18),
                    //                   child: Container(
                    //                     height:
                    //                         MediaQuery.of(context).size.height /
                    //                             2.9,
                    //                     width: 350,
                    //                     decoration: BoxDecoration(
                    //                       image: DecorationImage(
                    //                         fit: BoxFit.fill,
                    //                         image: NetworkImage(
                    //                           tableDetailResponse.data!
                    //                               .productImages!.first.image
                    //                               .toString(),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //                 ///enter qty title
                    //                 Padding(
                    //                   padding:
                    //                       const EdgeInsets.only(bottom: 15),
                    //                   child: Container(
                    //                     width:
                    //                         MediaQuery.of(context).size.width,
                    //                     child: Center(
                    //                       child: NeoStoreTitle(
                    //                         text: 'Enter Qty',
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   width:
                    //                       MediaQuery.of(context).size.width / 3,
                    //                   child: Center(
                    //                     child: NeoStoreTextFormField(
                    //                       hintText: 'qty',
                    //                       controller: _quantityController,
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //                 ///submit button
                    //                 Flexible(
                    //                   child: Container(
                    //                     width:
                    //                         MediaQuery.of(context).size.width,
                    //                     height:
                    //                         MediaQuery.of(context).size.height /
                    //                             2,
                    //                     child: Padding(
                    //                       padding:
                    //                           const EdgeInsets.only(top: 5),
                    //                       child: NeoStoreElevatedButton(
                    //                         text: ConstantStrings.submit,
                    //                         textStyle:
                    //                             TextStyles.titlelabel!.copyWith(
                    //                           color: ColorStyles.white,
                    //                         ),
                    //                         buttonStyle: TextButton.styleFrom(
                    //                           backgroundColor: ColorStyles.red,
                    //                         ),
                    //                         onPressed: () async {
                    //                           var response =
                    //                               await _listCartProvider
                    //                                   .getAddToCart(
                    //                             _listCartProvider
                    //                                 .tableDetailResponse!
                    //                                 .data!
                    //                                 .id!,
                    //                             int.parse(
                    //                                 _quantityController.text),
                    //                           );
                    //                           AddToCartResponse
                    //                               _addToCartResponse =
                    //                               AddToCartResponse.fromJson(
                    //                             jsonDecode(response),
                    //                           );
                    //                           if (_addToCartResponse.status ==
                    //                               200) {
                    //                             Navigator.push(
                    //                               context,
                    //                               MaterialPageRoute(
                    //                                 builder: (context) =>
                    //                                     MyCartView(),
                    //                               ),
                    //                             );
                    //                           } else {
                    //                             'please';
                    //                           }
                    //                         },
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    //   child: Container(
                    //     color: ColorStyles.light_grey,
                    //     child: Padding(
                    //       padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    //       child: Row(
                    //         children: [
                    //           NeoStoreTitle(
                    //             text: _listCartProvider
                    //                 .listCartResponse!.data![index].quantity
                    //                 .toString(),
                    //           ),
                    //           Icon(Icons.arrow_drop_down)
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
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
