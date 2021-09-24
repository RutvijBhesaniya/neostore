import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/presentation/model/order_detail_item.dart';
import 'package:neostore/presentation/model/order_list_item.dart';
import 'package:neostore/presentation/order_detail/order_detail_viewmodel.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class OrderDetailView extends BaseClass {
  final DataItems? dataItems;

  OrderDetailView({this.dataItems});

  @override
  BaseClassState getState() {
    return _OrderDetailViewState(dataItems);
  }
}

class _OrderDetailViewState extends BaseClassState {
  _OrderDetailViewState(this.dataItems);

  OrderDetailProvider? _orderDetailProvider;

  DataItems? dataItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _orderDetailProvider = OrderDetailProvider(Provider.of(context));
  }

  @override
  getAppBar() {
    return _appBar(dataItems?.id);
  }

  @override
  getBody() {
    return ChangeNotifierProvider<OrderDetailProvider>(
      create: (context) => _orderDetailProvider!,
      child: Consumer<OrderDetailProvider>(builder: (context, model, child) {
        return _orderDetailProvider?.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  _listViewBuilder(),

                  ///title and cost widget
                  _totalTitleAndCost()
                ],
              );
      }),
    );
  }

  ///title and cost widget
  Widget _totalTitleAndCost() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///total title widget
          _totalTitle(),

          ///total cost widget
          _totalCost()
        ],
      ),
    );
  }

  ///total cost widget
  Widget _totalCost() {
    return NeoStoreTitle(
      text: _orderDetailProvider?.orderDetailItem?.dataItem?.cost.toString(),
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline!.copyWith(
          fontWeight: FontWeight.w400,
          color: ColorStyles.black,
        ),
      ),
    );
  }

  ///total title widget
  Widget _totalTitle() {
    return NeoStoreTitle(
      text: ConstantStrings.total,
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline!.copyWith(
          fontWeight: FontWeight.w400,
          color: ColorStyles.black,
        ),
      ),
    );
  }

  Widget _listViewBuilder() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      itemCount: _orderDetailProvider
          ?.orderDetailItem?.dataItem?.orderDetailsItem?.length,
      itemBuilder: (context, index) {
        return _buildListItemDetail(
            _orderDetailProvider?.orderDetailItem, index);
      },
    );
  }

  //list item detail
  Widget _buildListItemDetail(OrderDetailItem? orderDetailItem, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///image widget
              _image(orderDetailItem, index),

              ///details widget
              _details(orderDetailItem, index),
            ],
          ),
          Divider(
            color: ColorStyles.black,
          )
        ],
      ),
    );
  }

  ///details widget
  Widget _details(OrderDetailItem? orderDetailItem, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///product title widget
            _title(orderDetailItem, index),

            ///product category widget
            _productCategoryName(orderDetailItem, index),

            ///quantity and cost widget
            _quantityAndCost(orderDetailItem, index)
          ],
        ),
      ),
    );
  }

  ///quantity and cost widget
  Widget _quantityAndCost(OrderDetailItem? orderDetailItem, int index) {
    return Flexible(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///quantity widget
              _quantity(orderDetailItem, index),

              ///cost widget
              _cost(orderDetailItem, index),
            ],
          ),
        ),
      ),
    );
  }

  ///cost widget
  Widget _cost(OrderDetailItem? orderDetailItem, int index) {
    return NeoStoreTitle(
      text:
          'RS ${orderDetailItem?.dataItem?.orderDetailsItem?[index].total}',
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline!.copyWith(
          fontWeight: FontWeight.w400,
          color: ColorStyles.dark_grey,
        ),
      ),
    );
  }

  ///quantity widget
  Widget _quantity(OrderDetailItem? orderDetailItem, int index) {
    return NeoStoreTitle(
      text:
          'OTY : ${orderDetailItem?.dataItem?.orderDetailsItem?[index].quantity} ',
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline!.copyWith(
          fontWeight: FontWeight.w400,
          color: ColorStyles.dark_grey,
        ),
      ),
    );
  }

  ///product category widget
  Widget _productCategoryName(
      OrderDetailItem? orderDetailItem, int index) {
    return NeoStoreTitle(
        text: orderDetailItem?.dataItem?.orderDetailsItem?[index].prodCatName,
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorStyles.dark_grey,
          ),
        ));
  }

  ///product title widget
  Widget _title(OrderDetailItem? orderDetailItem, int index) {
    return NeoStoreTitle(
        maxLine: 1,
        overflow: TextOverflow.ellipsis,
        text:
        orderDetailItem?.dataItem?.orderDetailsItem?[index].prodName,
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorStyles.dark_grey,
          ),
        ));
  }

  ///image widget
  Widget _image(OrderDetailItem? orderDetailItem, int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 7,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(orderDetailItem!
              .dataItem!.orderDetailsItem![index].prodImage
              .toString()),
        ),
      ),
    );
  }

  ///appbar widget
  Widget _appBar(int? id) {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.red,
      leading: GestureDetector(
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
      text:
          'Order Id: ${id ?? ' '}',
      style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
        fontWeight: FontWeight.w400,
      )),
    );
  }

  void fetchOrderDetail(int? orderId) {
    ///order detail method
    _orderDetailProvider?.getOrderDetail(orderId!);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchOrderDetail(dataItems?.id);
    });
  }
}
