import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/api/entity/delete_cart_entity.dart';
import 'package:neostore/data/api/entity/list_cart_entity.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/my_cart/my_cart_viewmodel.dart';
import 'package:neostore/presentation/order_address_list/order_address_list_view.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_divider.dart';
import 'package:neostore/presentation/widget/neostore_elevated_button.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
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
  CartProvider? _listCartProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _listCartProvider = CartProvider(
      Provider.of(context),
      Provider.of(context),
      Provider.of(context),
    );
  }

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return ChangeNotifierProvider<CartProvider>(
      create: (context) => _listCartProvider!,
      child: Consumer<CartProvider>(
        builder: (context, model, child) {
          return _listCartProvider?.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _listCartProvider?.listCartEntity?.dataEntity != null
                  ? _buildListItem(
                      _listCartProvider?.listCartEntity,
                    )
                  : Center(
                      child: NeoStoreTitle(
                        text: ConstantStrings.empty_cart,
                      ),
                    );
        },
      ),
    );
  }

  Widget _buildListItem(
    ListCartEntity? listCartResponse,
  ) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            ///list view builder
            _itemListViewBuilder(listCartResponse!),

            ///total price widget
            _totalPrice(),

            /// order now button
            _orderNowButton()
          ],
        ),
      ),
    );
  }

  ///list view builder
  Widget _itemListViewBuilder(ListCartEntity listCartResponse) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      itemCount: listCartResponse.dataEntity!.length,
      itemBuilder: (context, index) {
        return _buildListItemDetail(listCartResponse.dataEntity![index], index);
      },
    );
  }

  /// order now button
  Widget _orderNowButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: NeoStoreElevatedButton(
            text: ConstantStrings.order_now,
            textStyle: GoogleFonts.workSans(
              textStyle: TextStyles.titleHeadline?.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorStyles.white,
              ),
            ),
            buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderAddressListView(),
                ),
              );
            }),
      ),
    );
  }

  ///total price widget
  Widget _totalPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          ///total price label widget
          _totalPriceLabel(),

          ///rupees icon widget
          _rupeesIcon(),

          ///total rupees widget
          _totalRupees()
        ],
      ),
    );
  }

  ///total rupees widget
  Widget _totalRupees() {
    return NeoStoreTitle(
      text: _listCartProvider?.listCartEntity?.total.toString(),
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline?.copyWith(
          color: ColorStyles.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  ///rupees icon widget
  Widget _rupeesIcon() {
    return Flexible(
      child: Align(
        alignment: Alignment.centerRight,
        child: Icon(Icons.money_off),
      ),
    );
  }

  ///total price label widget
  Widget _totalPriceLabel() {
    return NeoStoreTitle(
      text: ConstantStrings.total,
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline?.copyWith(
          color: ColorStyles.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  ///list view builder detail
  Widget _buildListItemDetail(DataEntity data, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: [
              ///delete icon
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: ColorStyles.red,
                  ),
                  shape: BoxShape.circle,
                  color: ColorStyles.red,
                ),
                child: GestureDetector(
                  onTap: () async {
                    var deleteResponse = await _listCartProvider
                        ?.getDeleteCart(data.productId!.toInt());
                    DeleteCartEntity _deleteCartResponse =
                        DeleteCartEntity.fromJson(jsonDecode(deleteResponse));
                    if (_deleteCartResponse.status == 200) {
                      _listCartProvider?.getListCart();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyCartView(),
                        ),
                      );
                    }
                  },
                  child: Icon(
                    Icons.delete,
                    color: ColorStyles.white,
                  ),
                ),
              )
            ],
            child: Row(
              children: [
                ///image widget
                _image(data.productEntity?.productImages),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///product name widget
                        _productName(data.productEntity?.name),

                        ///product category widget
                        _productCategoryType(data.productEntity?.productCategory),

                        ///alert pop boxcart
                        DropdownButton<String>(
                          isExpanded: false,
                          hint: Text("Quantity"),
                          value: data.quantity.toString(),
                          items: _listCartProvider?.items.map((String value) {
                            return DropdownMenuItem<String>(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            _listCartProvider?.getEditCart(
                                data.productId!, value.toString());
                            _listCartProvider?.selected(
                                index, value.toString());
                          },
                        )
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.money_off),
                ),
                NeoStoreTitle(
                  text: data.productEntity?.subTotal,
                  style: GoogleFonts.workSans(
                    textStyle: TextStyles.titleHeadline?.copyWith(
                        color: ColorStyles.liver_grey,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          NeoStoreDivider(
            color: ColorStyles.black,
          )
        ],
      ),
    );
  }

  ///product category widget
  Widget _productCategoryType(String? productCategory) {
    return NeoStoreTitle(
      text: productCategory,
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline?.copyWith(
          color: ColorStyles.liver_grey,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  ///product name widget
  Widget _productName(String? name) {
    return NeoStoreTitle(
      text: name,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline?.copyWith(
          color: ColorStyles.liver_grey,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  ///image widget
  Widget _image(String? productImages) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 7,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            productImages!,
          ),
        ),
      ),
    );
  }

  ///widget app bar
  Widget _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.red,
      leading: GestureDetector(
        onTap: () {
          // Navigator.pop(context);
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
      text: ConstantStrings.myCart,
      style: TextStyles.titleHeadline?.copyWith(
        color: ColorStyles.white,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
    );
  }

  ///fetch cart method
  void fetchMyCartData() {
    _listCartProvider?.getListCart();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        ///fetch cart method
        fetchMyCartData();
      },
    );
  }
}
