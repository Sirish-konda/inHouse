import 'package:flutter/material.dart';
import 'package:fyp/common/loader.dart';
import 'package:fyp/common/star.dart';
import 'package:fyp/features/search/services/search_services.dart';
import 'package:fyp/features/worker_details/screens/worker_details_screen.dart';
import 'package:fyp/models/worker.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;

  const SearchScreen({
    super.key,
    required this.searchQuery,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Worker>? workers;

  final SearchServices searchServices = SearchServices();

  navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchedWorker();
  }

  fetchSearchedWorker() async {
    workers = await searchServices.fetchSearchedProduct(
      context: context,
      searchQuery: widget.searchQuery,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search Plumber',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: workers == null
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: workers!.length,
                      itemBuilder: (context, index) {
                        double avgRating = 0;
                        double totalRating = 0;
                        for (int i = 0;
                            i < workers![index].rating!.length;
                            i++) {
                          totalRating += workers![index].rating![i].rating;
                        }
                        if (totalRating != 0) {
                          avgRating =
                              totalRating / workers![index].rating!.length;
                        }
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, WorkerDetailsScreen.routeName,
                                arguments: workers![index]);
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
                                            workers![index].profilePicture,
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        workers![index].name.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Stars(rating: avgRating),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: Colors.green.shade900,
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
