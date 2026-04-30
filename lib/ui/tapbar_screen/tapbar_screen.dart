import 'package:flutter/material.dart';
import 'package:flutter_course/ui/tapbar_screen/custom_widgets/custom_container.dart';

// class OrdersScreen extends StatelessWidget {
//   const OrdersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Orders"),
//           bottom: TabBar(
//               // dividerColor: Colors.red,
//               // dividerHeight: 5,
//               indicatorColor: Colors.blue,
//               indicatorWeight: 5,
//               // isScrollable:true ,
//               onTap: (value) {
//                 print(value);
//               },
//               unselectedLabelColor: Colors.amber,
//               unselectedLabelStyle: TextStyle(fontSize: 10),
//               tabs: [
//                 Tab(
//                   text: "new",
//                   icon: Icon(Icons.new_label),
//                 ),
//                 Tab(
//                   text: "delivery",
//                 ),
//                 Tab(
//                   text: "canceld",
//                 ),
//               ]),
//         ),
//         body: TabBarView(children: [
//           Center(child: Text("here is new orders")),
//           Text("here is delivery orders"),
//           Text("here is canceld orders"),
//         ]),
//       ),
//     );
//   }
// }

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 50),

            // TabBar برا الـ AppBar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(text: 'New'),
                  Tab(text: 'Delivery'),
                  Tab(text: 'Completed'),
                ],
              ),
            ),

            // المحتوى
            const Expanded(
              child:  TabBarView(
                children: [
                  CustomContainer(
                    title: 'new Orders',
                    containerColor: Colors.black,
                  ),
                  CustomContainer(
                    title: 'Orders In Delivery',
                    containerColor: Colors.blue,
                  ),
                  CustomContainer(
                    title: 'Completed Orders',
                    containerColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
