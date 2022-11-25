import 'package:flutter/material.dart';
import 'package:mobile_cart/pages/account_page.dart';
import 'package:mobile_cart/pages/add_to_cart.dart';
import 'package:mobile_cart/pages/bottom_bar.dart';
import 'package:mobile_cart/pages/home_single_child_scroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // this is for bottom navigation bar:
  int myIndex = 0;
  List<Widget> widgetList = const [
    HomeSingle(),
    AddToCart(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Cart'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Add to cart',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account'
          ),
        ],
        currentIndex: myIndex,
        onTap: (int index){
          setState(() {
            myIndex = index;
          });
        },
      ),
    );
  }
}
