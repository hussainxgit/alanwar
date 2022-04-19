class Service {
  String uid, title, employeeEntry;
  double price;

  Service(
      {required this.uid,
        required this.title,
        required this.price,
        required this.employeeEntry});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'employeeEntry': employeeEntry,
      'price': price,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map, String uid) {
    return Service(
      uid: uid,
      title: map['title'] as String,
      employeeEntry: map['employeeEntry'] as String,
      price: map['price'] as double,
    );
  }
}