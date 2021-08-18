// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:neostore/base/base_class.dart';
// import 'package:neostore/data/widget/neostore_appbar.dart';
// import 'package:neostore/data/widget/neostore_title.dart';
// import 'package:neostore/utils/style.dart';
//
// class ProductListing extends BaseClass {
//   @override
//   BaseClassState getState() {
//     return _ProductListing();
//   }
// }
//
// class _ProductListing extends BaseClassState {
//   @override
//   getAppBar() {
//     return NeoStoreAppBar(
//       text: 'Tables',
//     );
//   }
//
//   @override
//   Widget getBody() {
//     return Scaffold(
//       body: ListView.builder(
//           shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           physics: ScrollPhysics(),
//           itemCount: tempList().length,
//           itemBuilder: (context, index) {
//             return listItem(tempList());
//           }),
//     );
//   }
//
//   List<String?> tempList() => ["test", "test"];
//
//   Widget listItem(dynamic tempList) {
//     return Column(
//       children: [
//         Container(
//           height: MediaQuery.of(context).size.height / 7,
//           width: double.infinity,
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Image.asset(
//                   'assets/images/chairs_image.png',
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 5),
//                         child: NeoStoreTitle(
//                           text: 'Stylish modern dinning tables',
//                           style: TextStyles.labelName!
//                               .copyWith(color: ColorStyles.liver_grey),
//                         ),
//                       ),
//                       NeoStoreTitle(
//                         text: 'Aron tables',
//                         style: TextStyles.subtitle!.copyWith(
//                           color: ColorStyles.liver_grey,
//                         ),
//                       ),
//                       Flexible(
//                         child: Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                               bottom: 5,
//                             ),
//                             child: NeoStoreTitle(
//                               text: 'Rs 27390',
//                               style: TextStyles.titleHeadline!.copyWith(
//                                 color: ColorStyles.light_red,
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Flexible(
//                   child: Align(
//                     alignment: Alignment.bottomRight,
//                     child: NeoStoreTitle(
//                       text: 'Rating',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Divider(
//           color: ColorStyles.dark_grey,
//         )
//       ],
//     );
//   }
// }
