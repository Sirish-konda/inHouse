import 'package:flutter/material.dart';
import 'package:fyp/common/loader.dart';
import 'package:fyp/features/admin/services/admin_services.dart';
import 'package:fyp/features/orderDetails/screens/order_details_screen.dart';
import 'package:fyp/models/order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;

  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: orders!.length,
            itemBuilder: (context, index) {
              final orderData = orders![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, OrderDetailsScreen.routeName,
                      arguments: orderData);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                  child: Column(
                    children: [
                      Text(orderData.name),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            },
          );
  }
}
