import 'package:ecommerce/presentation/resources/color_manager.dart';
import 'package:ecommerce/presentation/resources/strings_manager.dart';
import 'package:ecommerce/presentation/screens/auth/controllers/auth_controller.dart';
import 'package:ecommerce/presentation/screens/fav/controller/fav_controller.dart';
import 'package:ecommerce/presentation/screens/fav/widgets/fav_screen.dart';
import 'package:ecommerce/presentation/screens/home/widgets/home_screen.dart';
import 'package:ecommerce/presentation/screens/more/controller/more_controller.dart';
import 'package:ecommerce/presentation/screens/more/widgets/more_screen.dart';
import 'package:ecommerce/presentation/screens/orders/widgets/orders_screen.dart';
import 'package:ecommerce/presentation/widgets/dialogs/require_auth_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final AuthController _controller = Get.find<AuthController>();
  late final bool isUserLoggedIn;

  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const OrdersScreen(),
    const FavScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      if (!Get.find<AuthController>().isUserLoggedIn()) {
        showRequireAuthDialog(context);
      } else {
        setState(() {
          _selectedIndex = index;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Get.find<MoreController>();
    isUserLoggedIn = _controller.isUserLoggedIn();
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
            icon: /*Icon(
              Icons.favorite_border,
              color: _selectedIndex == 2 ? ColorManager.yellow : ColorManager.grey,
            )*/



            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Icon(
                    Icons.favorite_border,
                    color: _selectedIndex == 2 ? ColorManager.yellow : ColorManager.grey,
                  ),
                ),
                Positioned(
                  top: -5,
                  child: badges.Badge(
                    onTap: () {
                    },
                    badgeStyle: const badges.BadgeStyle(badgeColor: ColorManager.yellow),
                    position: badges.BadgePosition.topStart(top: -10, start: -12),
                    badgeContent: Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: GetX<FavController>(
                        init: Get.find<FavController>(),
                        builder: (FavController controller) {
                          return Text(
                            controller.fav.length.toString(),
                            style: const TextStyle(
                              color: ColorManager.white,
                              fontSize: 10
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )




            ,
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
