import 'package:flutter/material.dart';
import 'package:coffeemate/models/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  CoffeeTile({this.coffee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.brown[coffee.strength],
          ),
          title: Text(coffee.name),
          subtitle: Text('Takes ${coffee.sugars} sugars(s)'),
          trailing: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
