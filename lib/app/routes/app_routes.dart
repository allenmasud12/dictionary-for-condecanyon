import 'package:get/get.dart';

import '../../presentation/views/loading_screen.dart';
import '../../presentation/widgets/bottom_navbar.dart';


class AppRoutes {
  static const String initial = '/';
  static const String home = '/home';

  static final routes = [
    GetPage(name: initial, page: () => const LoadingScreen()),
    GetPage(name: home, page: () =>  const BottomBar()),
  ];
}
