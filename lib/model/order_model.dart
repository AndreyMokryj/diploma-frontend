class Order{
  int id;
  String username;
  List<int> placeIds;
  int sum;
  int status;

  Order({this.id, this.username, this.placeIds, this.sum, this.status});

  factory Order.fromMap(Map<String, dynamic> map) {
    final placeIdsStr = (map['placeIds'] as String).split(' ');
    List<int> placeIds = [];
    for(String el in placeIdsStr){
      if(el != "") {
        placeIds.add(int.parse(el));
      }
    };

    return Order(
      id: map['id'] as int,
      username: map['username'] as String,
      placeIds: placeIds,
      sum: map['sum'] as int,
      status: map['status'] as int,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'username' : username,
      'placeIds' : placeIds,
      'sum' : sum,
      'status' : status,
    };
  }
}