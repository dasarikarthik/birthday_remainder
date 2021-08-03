
class Wish{
  final String name;
  final DateTime date;

  Wish({this.name,this.date});

  Wish.fromMap(Map map) :
      this.name=map['name'],
      this.date=DateTime.tryParse(map['date']);

  Map toMap(){
    return {
      'name':this.name,
      'date':this.date.toIso8601String(),
    };
  }


}

