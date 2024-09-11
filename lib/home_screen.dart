import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/home_controller.dart';
import 'package:task/home_tab.dart';
import 'product_list_screen.dart';
import 'cart_screen.dart';
// import 'notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  RxList<Widget> widgetList = <Widget>[
    HomeTab(),
    cartScreen(),
    cartScreen(),
  ].obs;

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menu')),
            ListTile(
              title: Text('Products'),
              onTap: () {
                Get.to(ProductListScreen());
              },
            ),
            ListTile(
              title: Text('Cart'),
              onTap: () {
                Get.to(cartScreen());
              },
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {
                // Get.to(NotificationsScreen());=====
              },
            ),
          ],
        ),
      ),
      body: Obx(()=>widgetList.elementAt(homeController.currentValue.value)),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: _currentIndex, // Set the current index
        onTap: (value) {
          homeController.currentValue.value = value;
        }, // Handle tab changes
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black, // Selected tab color
        unselectedItemColor: Colors.grey, // Unselected tab color
      ),
    );
  }
}
