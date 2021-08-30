import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/order_list_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/my_account/my_account_viewmodel.dart';
import 'package:neostore/presentation/my_order/my_order_viewmodel.dart';
import 'package:neostore/presentation/order_detail/order_detail_view.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class MyOrderView extends BaseClass {
  @override
  BaseClassState getState() {
    return MyOrderViewState();
  }
}

class MyOrderViewState extends BaseClassState {
  late MyOrderProvider _myOrderProvider = Provider.of<MyOrderProvider>(context);

  @override
  getAppBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrderListData();
  }

  @override
  getBody() {
    return Container(
      child: _myOrderProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              itemCount: _myOrderProvider.orderListResponse!.data!.length,
              itemBuilder: (context, index) {
                return _buildListItem(
                    _myOrderProvider.orderListResponse, index);
              },
            ),
    );
  }

  Widget _buildListItem(OrderListResponse? orderListResponse, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailView(
                  _myOrderProvider.orderListResponse!.data![index].id),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NeoStoreTitle(
              text:
                  ('Order ID: ${orderListResponse!.data![index].id.toString()}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: NeoStoreTitle(
                    text: 'Rs ${orderListResponse.data![index].cost}',
                  ),
                ),
              ],
            ),
            Text('Ordered Date:  ${orderListResponse.data![index].created}'),
            Divider(
              color: ColorStyles.liver_grey,
            )
          ],
        ),
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

  void fetchOrderListData() {
    Future.delayed(Duration(milliseconds: 300), () {
      _myOrderProvider.getOrderList();
    });
  }
}
