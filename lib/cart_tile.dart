import 'package:ezrestaurantapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:ezrestaurantapp/models/menuCart.dart';
import 'package:toast/toast.dart';

class CartTile extends StatelessWidget {
  final MenuCart item;
  CartTile({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.lightGreenAccent,
          ), trailing: GestureDetector(
          child: Icon(Icons.highlight_remove),
          onTap: () async {
            await DatabaseService().removeFromCart(item.price);
            Toast.show("Successfully removed from cart", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER,backgroundRadius: 5);
          },
        ),
          title: Text(item.name),
          subtitle: Text('Price ${item.price}'),
        ),
      ),
    );
  }
}
