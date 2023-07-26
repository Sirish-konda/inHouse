import 'package:flutter/material.dart';
import 'package:fyp/features/order/services/order_services.dart';
import 'package:fyp/features/orderDetails/screens/order_details_screen.dart';
import 'package:fyp/models/order.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order>? orders;
  final OrderServices orderServices = OrderServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await orderServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Order',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 29,
          ),
        ),
      ),
      body: orders == null
          ? Center(
              child: Text('No orders'),
            )
          : Container(
              height: 500,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) =>
                                OrderDetailsScreen(order: orders![index]),
                          ),
                        );
                      },
                      child: Text(orders![0].name));
                },
                scrollDirection: Axis.horizontal,
                itemCount: orders!.length,
              ),
            ),
    );
  }
}
