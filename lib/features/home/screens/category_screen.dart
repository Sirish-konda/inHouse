import 'package:flutter/material.dart';
import 'package:fyp/common/loader.dart';
import 'package:fyp/features/home/services/home_services.dart';
import 'package:fyp/features/worker_details/screens/worker_details_screen.dart';
import 'package:fyp/models/worker.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Worker>? workerList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWorkersList();
  }

  fetchWorkersList() async {
    workerList = await homeServices.fetchCategoryWorkers(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plumber'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: workerList == null
            ? const Loader()
            : ListView.builder(
                itemCount: workerList!.length,
                itemBuilder: (context, index) {
                  final worker = workerList![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, WorkerDetailsScreen.routeName,
                          arguments: worker);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
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
                                image: DecorationImage(
                                    image: NetworkImage(
                                      worker.profilePicture,
                                    ),
                                    fit: BoxFit.cover),
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
                                  worker.name.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  worker.description,
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
                }),
      ),
    );
  }
}
