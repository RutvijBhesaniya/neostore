import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/order_detail_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/order_detail/order_detail_viewmodel.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class OrderDetailView extends BaseClass {
  final int? id;

  OrderDetailView({this.id});

  @override
  BaseClassState getState() {
    return _OrderDetailViewState(id);
  }
}

class _OrderDetailViewState extends BaseClassState {
  _OrderDetailViewState(this.id);

  OrderDetailProvider? _orderDetailProvider;

  int? id;

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  getBody() {
    _orderDetailProvider = Provider.of<OrderDetailProvider>(context);
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
      text: _orderDetailProvider?.orderDetailResponse?.data?.cost.toString(),
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
      itemCount:
          _orderDetailProvider?.orderDetailResponse?.data?.orderDetails?.length,
      itemBuilder: (context, index) {
        return _buildListItemDetail(
            _orderDetailProvider?.orderDetailResponse, index);
      },
    );
  }

  //list item detail
  Widget _buildListItemDetail(
      OrderDetailResponse? orderDetailResponse, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///image widget
              _image(orderDetailResponse!, index),

              ///details widget
              _details(orderDetailResponse, index),
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
  Widget _details(OrderDetailResponse orderDetailResponse, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///product title widget
            _title(orderDetailResponse, index),

            ///product category widget
            _productCategoryName(orderDetailResponse, index),

            ///quantity and cost widget
            _quantityAndCost(orderDetailResponse, index)
          ],
        ),
      ),
    );
  }

  ///quantity and cost widget
  Widget _quantityAndCost(OrderDetailResponse orderDetailResponse, int index) {
    return Flexible(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///quantity widget
              _quantity(orderDetailResponse, index),

              ///cost widget
              _cost(orderDetailResponse, index),
            ],
          ),
        ),
      ),
    );
  }

  ///cost widget
  Widget _cost(OrderDetailResponse orderDetailResponse, int index) {
    return NeoStoreTitle(
      text: 'RS ${orderDetailResponse.data!.orderDetails![index].total}',
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline!.copyWith(
          fontWeight: FontWeight.w400,
          color: ColorStyles.dark_grey,
        ),
      ),
    );
  }

  ///quantity widget
  Widget _quantity(OrderDetailResponse orderDetailResponse, int index) {
    return NeoStoreTitle(
      text: 'OTY : ${orderDetailResponse.data!.orderDetails![index].quantity} ',
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
      OrderDetailResponse orderDetailResponse, int index) {
    return NeoStoreTitle(
        text: orderDetailResponse.data!.orderDetails![index].prodCatName,
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorStyles.dark_grey,
          ),
        ));
  }

  ///product title widget
  Widget _title(OrderDetailResponse orderDetailResponse, int index) {
    return NeoStoreTitle(
        maxLine: 1,
        overflow: TextOverflow.ellipsis,
        text: orderDetailResponse.data!.orderDetails![index].prodName,
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorStyles.dark_grey,
          ),
        ));
  }

  ///image widget
  Widget _image(OrderDetailResponse orderDetailResponse, int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 7,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(orderDetailResponse
              .data!.orderDetails![index].prodImage
              .toString()),
        ),
      ),
    );
  }

  ///appbar widget
  Widget _appBar() {
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
      text:
          'Order Id: ${_orderDetailProvider?.orderDetailResponse?.data?.id.toString() ?? ' '}',
      style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!
              .copyWith(color: ColorStyles.white, fontWeight: FontWeight.w400)),
    );
  }

  void fetchOrderDetail(int orderId) {
    _orderDetailProvider?.getOrderDetail(orderId);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchOrderDetail(id!);
    });
  }
}
