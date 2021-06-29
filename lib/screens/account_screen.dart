import 'package:ezrestaurantapp/screens/cart_screen.dart';
import 'package:ezrestaurantapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Setting"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Acc",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: TextButton(
                  onPressed: () async {},
                  child: Text(
                    "Pay",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              side: BorderSide(color: Colors.grey)))),
                ),
              ),
            ],
          ),
        ),
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

              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
            }
          }),
    );
  }
}
