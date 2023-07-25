import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fyp/common/custom_button.dart';
import 'package:fyp/common/star.dart';
import 'package:fyp/features/address/screens/address_screen.dart';
import 'package:fyp/features/worker_details/services/worker_detail_services.dart';
import 'package:fyp/models/worker.dart';
import 'package:fyp/providers/user_provider.dart';
import 'package:provider/provider.dart';

class WorkerDetailsScreen extends StatefulWidget {
  static const String routeName = '/worker-details';
  final Worker worker;
  const WorkerDetailsScreen({
    super.key,
    required this.worker,
  });

  @override
  State<WorkerDetailsScreen> createState() => _WorkerDetailsState();
}

class _WorkerDetailsState extends State<WorkerDetailsScreen> {
  final WorkerDetailsService workerDetailsService = WorkerDetailsService();
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.worker.rating!.length; i++) {
      totalRating += widget.worker.rating![i].rating;
      if (widget.worker.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.worker.rating![i].rating;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / widget.worker.rating!.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        title: Text('ss'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.worker.id!),
                  Stars(
                    rating: avgRating,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(widget.worker.name.toUpperCase()),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: NetworkImage(widget.worker.profilePicture),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Hire Rate: ',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '\$${widget.worker.fee}',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                  ),
                  child: Text(
                    widget.worker.description,
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: CustomButton(
                    text: 'Hire Now',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) =>
                              AddressScreen(worker: widget.worker),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Rate the worker',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                RatingBar.builder(
                  minRating: 1,
                  initialRating: myRating,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (ctx, _) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (rating) {
                    workerDetailsService.rateWorker(
                      context: context,
                      worker: widget.worker,
                      rating: rating,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
