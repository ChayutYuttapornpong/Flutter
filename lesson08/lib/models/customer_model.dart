class CustomerModel {
  String uid;
  String name;
  int age;
  CustomerModel({
    required this.uid,
    required this.name,
    required this.age,
  });
  static CustomerModel? fromMap(Map<String, dynamic> customer) {
    // ignore: unnecessary_null_comparison
    if (customer == null) {
      return null;
    }
    String uid = customer['uid'];
    String name = customer['name'];
    int age = customer['age'];
    return CustomerModel(uid: uid, name: name, age: age);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'age': age,
    };
  }
}
