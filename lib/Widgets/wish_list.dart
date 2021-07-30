import 'package:flutter/material.dart';
import 'package:birthday_remainder/Widgets/wish_tile.dart';
import 'package:birthday_remainder/models/wish.dart';
import 'package:provider/provider.dart';
import 'package:birthday_remainder/models/wish_data.dart';

class WishList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<WishData>(
      builder: (context,wishData, child){
        return ListView.builder(
          itemBuilder: (context, index){
            final wish=wishData.wishs[index];
          return WishTile(
            name: wishData.wishs[index].name,
            date: wishData.wishs[index].date,
            pressedCallback: (){
              wishData.deleteWish(wish);
            },
          );
        },
          itemCount: wishData.wishs.length,
        );
      },

    );
  }
}