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
          ? const Center(
              child: Text('No orders'),
            )
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: double.infinity,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 125,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  orders![index].name.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  orders![index].description,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 19),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade900,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "View",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.vertical,
                itemCount: orders!.length,
              ),
            ),
    );
  }
}
