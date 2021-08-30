import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/order_detail_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/order_detail/order_detail_viewmodel.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class OrderDetailView extends BaseClass {
  int? id;

  OrderDetailView(this.id);

  @override
  BaseClassState getState() {
    return _OrderDetailViewState(id);
  }
}

class _OrderDetailViewState extends BaseClassState {
  _OrderDetailViewState(this.id);

  late OrderDetailProvider _orderDetailProvider =
      Provider.of<OrderDetailProvider>(context);

  int? id;

  @override
  getAppBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }

  @override
  getBody() {
    return _orderDetailProvider.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemCount: _orderDetailProvider
                    .orderDetailResponse!.data!.orderDetails!.length,
                itemBuilder: (context, index) {
                  return _buildListItemDetail(
                      _orderDetailProvider.orderDetailResponse, index);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NeoStoreTitle(
                      text: 'Total',
                    ),
                    NeoStoreTitle(
                      text: _orderDetailProvider.orderDetailResponse!.data!.cost
                          .toString(),
                    )
                  ],
                ),
              )
            ],
          );
  }

  Widget _buildListItemDetail(
      OrderDetailResponse? orderDetailResponse, int index) {
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
                    image: NetworkImage(orderDetailResponse!
                        .data!.orderDetails![index].prodImage
                        .toString()),
                  ),
                ),
              ),
              Column(
                children: [
                  NeoStoreTitle(
                    text:
                        orderDetailResponse.data!.orderDetails![index].prodName,
                  ),
                  NeoStoreTitle(
                    text: orderDetailResponse
                        .data!.orderDetails![index].prodCatName,
                  ),
                  NeoStoreTitle(
                    text:
                        'OTY : ${orderDetailResponse.data!.orderDetails![index].quantity} ',
                  )
                ],
              ),
              Flexible(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: NeoStoreTitle(
                      text:
                          'RS ${orderDetailResponse.data!.orderDetails![index].total}',
                    )),
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

  ///appbar widget
  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.purple,
      leading: Icon(
        Icons.arrow_back_ios,
        color: ColorStyles.white,
        size: 20,
      ),
      text: ConstantStrings.editProfile,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }

  void fetchOrderDetail(int orderId) {
    Future.delayed(Duration(milliseconds: 300), () {
      _orderDetailProvider.getOrderDetail(orderId);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrderDetail(id!);
  }
}
