import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/api/response/order_list_response.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/my_order/my_order_viewmodel.dart';
import 'package:neostore/presentation/order_detail/order_detail_view.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
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
  MyOrderProvider? _myOrderProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _myOrderProvider = MyOrderProvider(Provider.of(context));
  }

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      fetchOrderListData();
    });
  }

  @override
  getBody() {
    return ChangeNotifierProvider<MyOrderProvider>(
      create: (context) => _myOrderProvider!,
      child: Consumer<MyOrderProvider>(
        builder: (context, model, child) {
          return Container(
            child: _myOrderProvider?.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount:
                        _myOrderProvider?.orderListResponse?.data?.length,
                    itemBuilder: (context, index) {
                      return _buildListItem(
                          _myOrderProvider?.orderListResponse, index);
                    },
                  ),
          );
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
                  id: _myOrderProvider?.orderListResponse?.data?[index].id),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NeoStoreTitle(
                text:
                    ('Order ID: ${orderListResponse?.data?[index].id.toString()}'),
                style: GoogleFonts.workSans(
                  textStyle: TextStyles.titleHeadline?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorStyles.liver_grey,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: NeoStoreTitle(
                      text: 'Rs ${orderListResponse?.data?[index].cost}',
                      style: GoogleFonts.workSans(
                        textStyle: TextStyles.titleHeadline?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.liver_grey,
                        ),
                      )),
                ),
              ],
            ),
            NeoStoreTitle(
                text:
                    'Ordered Date:  ${orderListResponse?.data?[index].created}',
                style: GoogleFonts.workSans(
                  textStyle: TextStyles.titleHeadline?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorStyles.liver_grey,
                  ),
                )),
            Divider(
              color: ColorStyles.liver_grey,
            )
          ],
        ),
      ),
    );
  }

  ///appbar widget
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
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
      text: ConstantStrings.myOrders,
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline?.copyWith(
          fontWeight: FontWeight.w600,
          color: ColorStyles.white,
        ),
      ),
    );
  }

  void fetchOrderListData() {
    ///order list method
    _myOrderProvider?.getOrderList();
  }
}
