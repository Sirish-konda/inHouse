// import 'package:flutter/material.dart';
// import 'package:fyp/features/home/customer/customer_home_bottom.dart';
// import 'package:fyp/features/home/customer/customer_home_mid.dart';
// import 'package:fyp/features/home/customer/customer_home_top.dart';

// import 'customer_services.dart';

// class CustomerHome extends StatelessWidget {
//   const CustomerHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 24,
//           vertical: 30,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 1,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Column(
//                     children: [
//                       CustomerHomeTop(),
//                       CustomerHomeMid(),
//                       CustomerHomeBottom(),
//                       CustomerSerivces(
//                         title: 'Kitchen drainage',
//                         desc: 'We can solve it',
//                         price: 300,
//                         iconValue: Icons.water_damage_outlined,
//                       ),
//                       CustomerSerivces(
//                         title: 'Toilet drainage',
//                         desc: 'We can solve it',
//                         price: 200,
//                         iconValue: Icons.bathroom_outlined,
//                       ),
//                       CustomerSerivces(
//                         title: 'Basin drainage',
//                         desc: 'We can solve it',
//                         price: 500,
//                         iconValue: Icons.water_drop_outlined,
//                       ),
//                       CustomerSerivces(
//                         title: 'Pipeline Management',
//                         desc: 'We can solve it',
//                         price: 900,
//                         iconValue: Icons.pin_drop_rounded,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
