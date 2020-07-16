class Product {
  String name;
  double price;
  String imageUrl;
  String description;
  Product({this.name, this.description, this.imageUrl, this.price});
  toJson() {
    Map<String, dynamic> map = {};
    map['name'] = this.name;
    map['price'] = this.price;
    map['description'] = this.description;
    map['imageUrl'] = this.imageUrl;
    return map;
  }
}
