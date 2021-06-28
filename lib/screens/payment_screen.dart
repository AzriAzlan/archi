import 'package:cool_alert/cool_alert.dart';
import 'package:ezrestaurantapp/models/bank_.dart';
import 'package:ezrestaurantapp/screens/home_screen.dart';
import 'package:ezrestaurantapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentScreen extends StatefulWidget {
  bool usernameEmpty = false;
  bool passwordEmpty = false;
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Item selectedBank;
  List<Item> bank = <Item>[
    Item('Bank Islam'),
    Item('Maybank'),
    Item('CIMB'),
    Item('OCBC'),
  ];
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Payment"),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.red,
          ),
          resizeToAvoidBottomInset: false,
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
                    "Payment",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  DropdownButton<Item>(
                    hint: Text("Select Bank"),
                    value: selectedBank,
                    onChanged: (Item Value) {
                      setState(() {
                        selectedBank = Value;
                      });
                    },
                    items: bank.map((Item user) {
                      return DropdownMenuItem<Item>(
                        value: user,
                        child: Row(
                          children: <Widget>[
                            Text(
                              user.name,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
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
                          helperText: widget.usernameEmpty ? "Required" : "",
                          helperStyle: TextStyle(color: Colors.red),
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
                          helperText: widget.passwordEmpty ? "Required" : "",
                          helperStyle: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: TextButton(
                      onPressed: () async {
                        await DatabaseService().emptyCart();
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.loading,
                        );
                        await Future.delayed(Duration(milliseconds: 1500));
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: "Your transaction was successful!",
                            onConfirmBtnTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  )
                                });
                      },
                      child: Text(
                        "Pay",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      side: BorderSide(color: Colors.grey)))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
