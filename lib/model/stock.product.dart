class StockProduct {
  int? idProduct;
  String? productName;
  String? imageProduct;
  int? jumlahStock;
  int? price;

  StockProduct({
    this.idProduct,
    this.productName,
    this.jumlahStock,
    this.imageProduct,
    this.price
});
  factory StockProduct.fromJson(Map<String, dynamic> json) {
    return StockProduct(
      idProduct: json['id_stock'] ?? 0,
      productName: json['productName'] ?? '',
      jumlahStock: json['jumlah_stock'] ?? 0,
      imageProduct: json['image_product'] ?? '',
      price: json['price'] ?? 0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_stock': idProduct,
      'productName': productName,
      'jumlah_stock': jumlahStock,
      'image_product': imageProduct,
      'price': price
    };
  }
}