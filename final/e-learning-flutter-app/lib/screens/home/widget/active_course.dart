// import 'package:e_learning_app/constants/colors.dart';
// import 'package:e_learning_app/screens/home/widget/category_title.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// class ActiveCourse extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           CategoryTitle('Currently Active', 'View All'),
//           Container(
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.all(25),
//             decoration: BoxDecoration(
//               color: kFontLight.withOpacity(0.1),
//               border: Border.all(color: kFontLight.withOpacity(0.3), width: 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child:
//                           Image.asset('assets/images/progress.png', width: 60),
//                     ),
//                     const SizedBox(width: 20),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'Mathematics',
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: kFont),
//                         ),
//                         Text(
//                           '2 lessons left',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: kFontLight),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 CircularPercentIndicator(
//                   radius: 30,
//                   lineWidth: 5.0,
//                   progressColor: kAccent,
//                   percent: 0.61,
//                   center: const Text(
//                     '61%',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
