import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/fav/widgets/fav_screen.dart';
import 'package:ecommerce/presentation/screens/home/widgets/home_screen.dart';
import 'package:ecommerce/presentation/screens/more/more_screen.dart';
import 'package:ecommerce/presentation/screens/orders/widgets/orders_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    OrdersScreen(),
    FavScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedItemColor: ColorManager.grey,
        selectedItemColor: ColorManager.primary,
        selectedFontSize: 16,
        selectedIconTheme: const IconThemeData(size: 26),
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.lightGrey,
        items: [
          // الرئيسية
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? ColorManager.yellow : ColorManager.grey,
            ),
            label: AppStrings.main,
          ),
          // طلباتى
          BottomNavigationBarItem(
            icon: Icon(
              Icons.abc,
              color: _selectedIndex == 1 ? ColorManager.yellow : ColorManager.grey,
            ),
            label: AppStrings.myOrders,
          ),
          // المفضلة
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: _selectedIndex == 2 ? ColorManager.yellow : ColorManager.grey,
            ),
            label: AppStrings.fav,
          ),
          // المزيد
          BottomNavigationBarItem(
            icon: Icon(
              Icons.square,
              color: _selectedIndex == 3 ? ColorManager.yellow : ColorManager.grey,
            ),
            label: AppStrings.more,
          ),
        ],
      ),
      body:  Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
    );
  }
}
