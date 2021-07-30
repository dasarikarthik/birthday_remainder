import 'package:flutter/material.dart';
import 'package:birthday_remainder/models/wish.dart';
import 'package:provider/provider.dart';
import 'package:birthday_remainder/models/wish_data.dart';

class AddWishPage extends StatefulWidget {


  @override
  _AddWishPageState createState() => _AddWishPageState();
}

class _AddWishPageState extends State<AddWishPage> {
  String newWishName;

  DateTime date;

  Future pickDate(BuildContext context)async{
    final initialDate=DateTime.now();
    final newDate= await showDatePicker(
      context: (context),
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year-30),
      lastDate: DateTime(DateTime.now().year+30),
    );
    if(newDate==null) return;
    else{
      setState(() {
        date=newDate;
      });
    }
  }

  String getText(){
    if(date==null){
      return "Select Date";
    }
    else{
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Person to Wish"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.check,
        ),
        onPressed: (){
          Provider.of<WishData>(context,listen:false).addWish(newWishName, date);
          Navigator.pop(context);

        },
      ),
      body:Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                  newWishName=newText;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
                color: Colors.lightBlueAccent,
                onPressed: ()=> pickDate(context),
                textColor: Colors.white,
                child: Text(
                    getText(),
                )
            ),

          ],
        ),
      ),
    );
  }
}
