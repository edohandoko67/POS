
class Product {
  int? id;
  String? name;
  String? pembuat;
  double? price;
  String? alasan;
  int? discount;
  int? quantity;

  Product({
    this.id,
    this.name,
    this.pembuat,
    this.price,
    this.alasan,
    this.quantity,
    this.discount
});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id_product'] ?? 0,
      name: json['name'] ?? '',
      pembuat: json['pembuat'] ?? '',
      price: json['price'] ?? 0.0,
      alasan: json['alasan'] ?? '',
      quantity: json['quantity'] ?? 0,
      discount: json['discount'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id_product': id,
      'name': name,
      'pembuat': pembuat,
      'price': price,
      'alasan': alasan,
      'quantity': quantity,
      'discount': discount
    };
  }
}