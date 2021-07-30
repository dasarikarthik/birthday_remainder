import 'package:flutter/material.dart';
class WishTile extends StatelessWidget {
  final String name;
  final DateTime date;
  final Function pressedCallback;

  WishTile({this.name,this.date,this.pressedCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(name),
      subtitle: Text('${date.day}/${date.month}/${date.year}'),
      trailing: FlatButton(
          child: Icon(Icons.delete),
        onPressed: (){
          pressedCallback();
        },
      ),
    );
  }
}
