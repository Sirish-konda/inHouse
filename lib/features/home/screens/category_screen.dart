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
                    child: ListTile(
                      title: Text(worker.name),
                    ),
                  );
                }),
      ),
    );
  }
}
