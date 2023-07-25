import 'package:flutter/material.dart';
import 'package:fyp/common/loader.dart';
import 'package:fyp/features/admin/screens/add_worker_screen.dart';
import 'package:fyp/features/admin/services/admin_services.dart';
import 'package:fyp/models/worker.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminServices adminServices = AdminServices();
  List<Worker>? workers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllWorkers();
  }

  fetchAllWorkers() async {
    workers = await adminServices.fetchAllWorkers(context);
    setState(() {});
  }

  void deleteProduct(Worker worker, int index) {
    adminServices.deleteWorker(
      context: context,
      worker: worker,
      onSuccess: () {
        workers!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddWorker() {
    Navigator.pushNamed(context, AddWorkerScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return workers == null
        ? const Loader()
        : Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: navigateToAddWorker,
              tooltip: 'Add a worker',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: ListView.builder(
              itemCount: workers!.length,
              itemBuilder: ((context, index) => Dismissible(
                    direction: DismissDirection.startToEnd,
                    confirmDismiss: (DismissDirection direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Remove Worker"),
                            content: const Text(
                                "Are you sure you want to remove this person?"),
                            actions: <Widget>[
                              ElevatedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text("Yes")),
                              ElevatedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("No"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    key: ValueKey(workers![index].id),
                    background: Container(
                      color: Colors.red,
                    ),
                    secondaryBackground: Container(
                      color: Colors.green,
                    ),
                    onDismissed: (direction) {
                      deleteProduct(workers![index], index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Worker Deleted'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: NetworkImage(
                                workers![index].profilePicture,
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      title: Text(
                        workers![index].name.toUpperCase(),
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        workers![index].description,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  )),
            ),
          );
  }
}
