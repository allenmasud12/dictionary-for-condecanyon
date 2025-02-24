import 'package:get/get.dart';

import '../../presentation/views/home.dart';
import '../../presentation/views/loading_screen.dart';


class AppRoutes {
  static const String initial = '/';
  static const String home = '/home';

  static final routes = [
    GetPage(name: initial, page: () => const LoadingScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
  ];
}
