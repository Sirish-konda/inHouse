import 'package:flutter/material.dart';
import 'package:fyp/common/bottom_bar.dart';

import 'package:fyp/features/admin/screens/add_worker_screen.dart';
import 'package:fyp/features/auth/screens/auth_screen.dart';
import 'package:fyp/features/home/screens/category_screen.dart';
import 'package:fyp/features/home/screens/home_screens.dart';
import 'package:fyp/features/orderDetails/screens/order_details_screen.dart';
import 'package:fyp/features/search/search_screen.dart';
import 'package:fyp/features/worker_details/screens/worker_details_screen.dart';
import 'package:fyp/models/order.dart';
import 'package:fyp/models/worker.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );

    case AddWorkerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddWorkerScreen(),
      );

    case CategoryScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryScreen(category: category),
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );

    case WorkerDetailsScreen.routeName:
      var worker = routeSettings.arguments as Worker;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => WorkerDetailsScreen(
          worker: worker,
        ),
      );

    case OrderDetailsScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailsScreen(
          order: order,
        ),
      );
    // case AddressScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const AddressScreen(),
    //   );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen doesnt exists'),
          ),
        ),
      );
  }
}
