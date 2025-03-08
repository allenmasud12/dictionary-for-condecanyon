import 'package:dictionary/presentation/views/favourite_screen.dart';
import 'package:dictionary/presentation/views/home.dart';
import 'package:dictionary/presentation/views/menu_screen.dart';
import 'package:dictionary/resources/value_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/colour_manager.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: AppSize.s60,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedFontSize: AppSize.s10,
          items:  [
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              activeIcon: Icon(Icons.favorite_border_outlined, color: ColorManager.primary,),
              label: 'Favourite',
            ),

            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home, color: ColorManager.primary,),
              label: 'Home',
            ),

            BottomNavigationBarItem(
                icon: const Icon(Icons.menu),
                activeIcon: Icon(Icons.menu, color: ColorManager.primary,),
                label: "Menu"),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
        ],
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const FavouriteScreen(),
         HomeScreen(),
          const MenuScreen()
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}