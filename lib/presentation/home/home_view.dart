import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/list_cart_response.dart';
import 'package:neostore/data/widget/carousel_slider.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/data/widget/neostore_title_with_icons.dart';
import 'package:neostore/presentation/chair_category/chair_category_view.dart';
import 'package:neostore/presentation/cupboard_category/cupboard_category_view.dart';
import 'package:neostore/presentation/home/home_viewmodel.dart';
import 'package:neostore/presentation/login/login_view.dart';
import 'package:neostore/presentation/my_cart/my_cart_view.dart';
import 'package:neostore/presentation/my_order/my_order_view.dart';
import 'package:neostore/presentation/profile_details/profile_details_view.dart';
import 'package:neostore/presentation/sofa_category/sofa_category_view.dart';
import 'package:neostore/presentation/store_locator/store_locator_view.dart';
import 'package:neostore/presentation/table_category/table_category_view.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class HomeScreen extends BaseClass {
  @override
  BaseClassState getState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends BaseClassState {
  HomeProvider? _homeProvider;

  Duration duration = const Duration(microseconds: 300);

  late Size size = MediaQuery.of(context).size;

  // Size size = MediaQuery.
  late double? screenHeight = size.height;
  late double? screenWidth = size.width;

  @override
  Widget getBody() {
    // _drawerProvider = Provider.of<DrawerProvider>(context);
    _homeProvider = Provider.of<HomeProvider>(context);

    return _homeProvider?.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: MediaQuery.of(context).size.height,
            color: ColorStyles.dark_grey,
            child: Stack(
              children: [
                menu(context, _homeProvider?.listCartResponse),
                dashboard(context),
              ],
            ),
          );
  }

  Widget menu(context, ListCartResponse? listCartResponse) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  children: [
                    ///profile pic widget
                    _profilePic(),

                    ///full name
                    _fullName(),

                    ///email
                    _email(),
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

                    ///my cart widget
                    _myCart(listCartResponse),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),

                    /// table category widget
                    _tableCategory(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),

                    ///sofa category widget
                    _sofaCategory(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),

                    ///chair category widget
                    _chairCategory(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),

                    ///cupboard category widget
                    _cupboardCategory(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),

                    ///my account widget
                    _myAccount(context),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),

                    ///store locator widget
                    _storeLocator(context),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),

                    ///my order widget
                    _myOrder(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Divider(
                        color: ColorStyles.black,
                      ),
                    ),

                    ///logout widget
                    _logout(context),
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

  ///logout widget
  Widget _logout(context) {
    return GestureDetector(
      onTap: () async {
        print('logout${MemoryManagement.clearMemory()}');
        MemoryManagement.setRemove(remove: 'email');

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreenView(),
            ),
            (route) => false);
      },
      child: NeoStoreTitleWithIcons(
        image: ('assets/images/logout_icon.png'),
        text: ConstantStrings.logout,
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
      ),
    );
  }

  ///my order widget
  Widget _myOrder() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyOrderView(),
          ),
        );
      },
      child: NeoStoreTitleWithIcons(
        image: ('assets/images/my_orders_icon.png'),
        text: ConstantStrings.myOrders,
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline?.copyWith(
            color: ColorStyles.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  ///store locator widget
  Widget _storeLocator(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoreLocatorView(),
          ),
        );
      },
      child: NeoStoreTitleWithIcons(
        image: ('assets/images/store_locator_icon.png'),
        text: ConstantStrings.storeLocator,
        style: TextStyles.titleHeadline?.copyWith(
          color: ColorStyles.white,
        ),
      ),
    );
  }

  ///my account widget
  Widget _myAccount(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileDetailsView()),
        );
      },
      child: NeoStoreTitleWithIcons(
        image: ('assets/images/username_icon.png'),
        text: ConstantStrings.myAccount,
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
      ),
    );
  }

  ///cupboard category widget
  Widget _cupboardCategory() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CupboardCategoryView(),
          ),
        );
      },
      child: NeoStoreTitleWithIcons(
        image: ('assets/images/cupboard_icon.png'),
        text: ConstantStrings.cupboards,
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
      ),
    );
  }

  ///chair category widget
  Widget _chairCategory() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChairCategoryView(),
          ),
        );

      },
      child: NeoStoreTitleWithIcons(
        image: ('assets/images/sofa_icon.png'),
        text: ConstantStrings.chairs,
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
      ),
    );
  }

  ///sofa category widget
  Widget _sofaCategory() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SofaCategoryView(),
          ),
        );

      },
      child: NeoStoreTitleWithIcons(
        image: ('assets/images/sofa_icon.png'),
        text: ConstantStrings.sofas,
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
          color: ColorStyles.white,
          fontWeight: FontWeight.w400,
        )),
      ),
    );
  }

  /// table category widget
  Widget _tableCategory() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TableCategoryView(),
          ),
        );
      },
      child: NeoStoreTitleWithIcons(
        image: ('assets/images/table_icon.png'),
        text: ConstantStrings.tables,
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
      ),
    );
  }

  ///my cart widget
  Widget _myCart(ListCartResponse? listCartResponse) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyCartView(),
              ),
            );
          },
          child: NeoStoreTitleWithIcons(
            image: ('assets/images/shopping_cart.png'),
            text: ConstantStrings.myCart,
            style: GoogleFonts.workSans(
              textStyle: GoogleFonts.workSans(
                textStyle: TextStyles.titleHeadline?.copyWith(
                  color: ColorStyles.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 0.22 * screenWidth!.toDouble(),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ColorStyles.light_red, width: 8),
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.all(Radius.circular(50)),
              color: ColorStyles.light_red),
          child: NeoStoreTitle(
            text: listCartResponse?.data != null
                ? listCartResponse?.count.toString()
                : '0',
            style: TextStyles.titleHeadline?.copyWith(color: ColorStyles.white),
          ),
        )
      ],
    );
  }

  ///email
  Widget _email() {
    return NeoStoreTitle(
      text: _homeProvider?.myAccountResponse?.data?.userData?.email,
      // _homeProvider.myAccountResponse?.data?.userData?.email,
      style: GoogleFonts.workSans(
        textStyle: TextStyles.labelName
            ?.copyWith(color: ColorStyles.white, fontWeight: FontWeight.w400),
      ),
    );
  }

  ///full name
  Widget _fullName() {
    return NeoStoreTitle(
      text: _homeProvider?.myAccountResponse?.data?.userData?.firstName!,
      style: GoogleFonts.workSans(
        textStyle: TextStyles.titleHeadline
            ?.copyWith(color: ColorStyles.white, fontWeight: FontWeight.w400),
      ),
      color: ColorStyles.red,
    );
  }

  ///profile pic widget
  Widget _profilePic() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CircleAvatar(
        backgroundColor: ColorStyles.blue,
        radius: 60,
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: !_homeProvider!.getCurrentDrawer ? 0 : 0.2 * screenHeight!,
      bottom: !_homeProvider!.getCurrentDrawer ? 0 : 0.2 * screenWidth!,
      left: !_homeProvider!.getCurrentDrawer ? 0 : 0.7 * screenWidth!,
      right: !_homeProvider!.getCurrentDrawer ? 0 : -0.4 * screenWidth!,
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
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                        onTap: () {
                          var value = _homeProvider?.getCurrentDrawer;
                          _homeProvider?.setCurrentDrawer(!value!);
                          // print("current=>${_drawerProvider.getCurrentDrawer}");
                        },
                        child: Icon(
                          _homeProvider!.getCurrentDrawer
                              ? Icons.arrow_back
                              : Icons.menu,
                          color: ColorStyles.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: NeoStoreTitle(
                        text: ConstantStrings.neoStore,
                        style: TextStyles.titleHeadline?.copyWith(
                          color: ColorStyles.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
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
                                  builder: (context) => TableCategoryView(),
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
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChairCategoryView(),
                                ),
                              );

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/chairs_image.png',
                                  ),
                                ),
                              ),
                              height: MediaQuery.of(context).size.height / 4,
                            ),
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
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SofaCategoryView(),
                                ),
                              );

                            },
                            child: Container(
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
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CupboardCategoryView(),
                                ),
                              );
                              },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/cupboard_image.png',
                                  ),
                                ),
                              ),
                              height: MediaQuery.of(context).size.height / 4,
                            ),
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

  void fetchMyCartData() {
    _homeProvider?.getListCountCart();
    _homeProvider?.getMyAccount();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      fetchMyCartData();
      _homeProvider?.setCurrentDrawer(false);
    });
  }
}
