import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/widget/carousel_slider.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/data/widget/neostore_title_with_icons.dart';
import 'package:neostore/presentation/home/drawer_viewmodel.dart';
import 'package:neostore/presentation/product_listing/product_listing.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class HomeScreen extends BaseClass {
  @override
  BaseClassState getState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends BaseClassState {
  late DrawerProvider _drawerProvider;
  Duration duration = const Duration(microseconds: 300);

  late Size? size = ScreenUtil().uiSize;
  // Size size = MediaQuery.
  late double? screenHeight = size!.height;
  late double? screenWidth = size!.width;

  @override
  Widget getBody() {
    _drawerProvider = Provider.of<DrawerProvider>(context);

    return Container(
      color: ColorStyles.dark_grey,
      child: Stack(
        children: [
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                // width: ScreenUtil().screenWidth / 1.5,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorStyles.blue,
                      radius: 60,
                    ),
                    NeoStoreTitle(
                      text: 'Rutvij Bhesaniya',
                      style: TextStyles.titleHeadline!.copyWith(
                        color: ColorStyles.white,
                      ),
                      color: ColorStyles.red,
                    ),
                    NeoStoreTitle(
                      text: 'rut@gmail.com',
                      style: TextStyles.labelName!.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),
                    NeoStoreTitleWithIcons(
                      image: ('assets/images/shopping_cart.png'),
                      text: ConstantStrings.myCart,
                      style: TextStyles.titleHeadline!.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),
                    NeoStoreTitleWithIcons(
                      image: ('assets/images/table_icon.png'),
                      text: ConstantStrings.tables,
                      style: TextStyles.titleHeadline!.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),
                    NeoStoreTitleWithIcons(
                      image: ('assets/images/sofa_icon.png'),
                      text: ConstantStrings.sofas,
                      style: TextStyles.titleHeadline!.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),
                    NeoStoreTitleWithIcons(
                      image: ('assets/images/sofa_icon.png'),
                      text: ConstantStrings.chairs,
                      style: TextStyles.titleHeadline!.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),
                    NeoStoreTitleWithIcons(
                      image: ('assets/images/cupboard_icon.png'),
                      text: ConstantStrings.cupboards,
                      style: TextStyles.titleHeadline!.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),
                    NeoStoreTitleWithIcons(
                      image: ('assets/images/username_icon.png'),
                      text: ConstantStrings.myAccount,
                      style: TextStyles.titleHeadline!.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),
                    NeoStoreTitleWithIcons(
                      image: ('assets/images/store_locator_icon.png'),
                      text: ConstantStrings.storeLocator,
                      style: TextStyles.titleHeadline!.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),
                    NeoStoreTitleWithIcons(
                      image: ('assets/images/my_orders_icon.png'),
                      text: ConstantStrings.myOrders,
                      style: TextStyles.titleHeadline!.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),
                    NeoStoreTitleWithIcons(
                      image: ('assets/images/logout_icon.png'),
                      text: ConstantStrings.logout,
                      style: TextStyles.titleHeadline!.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: !_drawerProvider.getCurrentDrawer ? 0 : 0.2 * screenHeight!,
      bottom: !_drawerProvider.getCurrentDrawer ? 0 : 0.2 * screenWidth!,
      left: !_drawerProvider.getCurrentDrawer ? 0 : 0.7 * screenWidth!,
      right: !_drawerProvider.getCurrentDrawer ? 0 : -0.4 * screenWidth!,
      child: SafeArea(
        child: Material(
          elevation: 8,
          child: ListView(
            children: [
              Container(
                color: ColorStyles.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          var value = _drawerProvider.getCurrentDrawer;
                          _drawerProvider.setCurrentDrawer(!value);
                          print("current=>${_drawerProvider.getCurrentDrawer}");
                        },
                        child: Icon(
                          _drawerProvider.getCurrentDrawer
                              ? Icons.arrow_back
                              : Icons.menu,
                          color: ColorStyles.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: NeoStoreTitle(
                        text: ConstantStrings.neoStore,
                        style: TextStyles.titleHeadline!.copyWith(
                          color: ColorStyles.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: ColorStyles.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: CarouselSliderScreen(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductListing(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/table_image.png',
                                  ),
                                ),
                              ),
                              height: MediaQuery.of(context).size.height / 4,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/images/chairs_image.png',
                                ),
                              ),
                            ),
                            height: MediaQuery.of(context).size.height / 4,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/images/sofa_image.png',
                                ),
                              ),
                            ),
                            height: MediaQuery.of(context).size.height / 4,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/images/cupboard_image.png',
                                ),
                              ),
                            ),
                            height: MediaQuery.of(context).size.height / 4,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
