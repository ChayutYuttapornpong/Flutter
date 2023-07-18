class ProductModel {
  String id;
  String productName;
  double price;

  ProductModel({
    required this.id,
    required this.productName,
    required this.price,
  });
  static ProductModel? fromMap(Map<String, dynamic> product) {
    // ignore: unnecessary_null_comparison
    if (product == null) {
      return null;
    }
    String id = product['id'];
    String productName = product['productName'];
    double price = product['price'];
    return ProductModel(
      id: id,
      productName: productName,
      price: price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'price': price,
    };
  }
}
