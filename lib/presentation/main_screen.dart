import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/fav/widgets/fav_screen.dart';
import 'package:ecommerce/presentation/screens/home/widgets/home_screen.dart';
import 'package:ecommerce/presentation/screens/more/widgets/more_screen.dart';
import 'package:ecommerce/presentation/screens/orders/widgets/orders_screen.dart';
import 'package:ecommerce/presentation/widgets/dialogs/require_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/local/local_data_source.dart';
import '../di/di.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final LocalDataSource _appPreferences = instance<LocalDataSource>();
  late final bool isUserLoggedIn;

  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const OrdersScreen(),
    const FavScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 0 || index == 3) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      if (isUserLoggedIn) {
        setState(() {
          _selectedIndex = index;
        });
      } else {
        showRequireAuthDialog(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    isUserLoggedIn = _appPreferences.isUserLoggedIn();
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
            label: AppStrings.main.tr,
          ),
          // طلباتى
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_offer_outlined,
              color: _selectedIndex == 1 ? ColorManager.yellow : ColorManager.grey,
            ),
            label: AppStrings.myOrders.tr,
          ),
          // المفضلة
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: _selectedIndex == 2 ? ColorManager.yellow : ColorManager.grey,
            ),
            label: AppStrings.fav.tr,
          ),
          // المزيد
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more,
              color: _selectedIndex == 3 ? ColorManager.yellow : ColorManager.grey,
            ),
            label: AppStrings.more.tr,
          ),
        ],
      ),
      body:  Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
