import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:birthday_remainder/models/wish.dart';
class WishData extends ChangeNotifier{
  List<Wish> _wishs=[
    Wish(name: "karthik",date: DateTime.now()),
    Wish(name: "karthik",date: DateTime.now()),

  ];
  UnmodifiableListView<Wish> get wishs{
    return UnmodifiableListView(_wishs);
  }

  void addWish(String newWishName,DateTime date){
  final wish = Wish(name:newWishName, date: date );
  _wishs.add(wish);
  notifyListeners();
  }
  void deleteWish(Wish wish){
    _wishs.remove(wish);
    notifyListeners();
  }
}