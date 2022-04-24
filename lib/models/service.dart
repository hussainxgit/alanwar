class Service {
 String title, employeeEntry;
  double price;

  Service(
      {
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

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      title: map['title'] as String,
      employeeEntry: map['employeeEntry'] as String,
      price: map['price'] as double,
    );
  }
}