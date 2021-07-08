//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// class HomeScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> categories = [
//       {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
//       {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
//       {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
//       {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
//       {"icon": "assets/icons/Discover.svg", "text": "More"},
//     ];
//     return Padding(
//       padding: EdgeInsets.all(20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: List.generate(
//           categories.length,
//               (index) => CategoryCard(
//             icon: categories[index]["icon"],
//             text: categories[index]["text"],
//             press: () {},
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// }