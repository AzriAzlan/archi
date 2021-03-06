import 'package:ezrestaurantapp/models/menuCart.dart';
import 'package:ezrestaurantapp/screens/account_screen.dart';
import 'package:ezrestaurantapp/screens/home_screen.dart';
import 'package:ezrestaurantapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_list.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MenuCart>>.value(
      value: DatabaseService().cart,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: SizedBox(
            child: CartList(),
            height: 600,
            width: double.maxFinite,
          ),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.red,
            items: const <BottomNavigationBarItem>[
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
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (_selectedIndex) {
              switch (_selectedIndex) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  break;

                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                  break;
              }
            }),
      ),
    );
  }
}
