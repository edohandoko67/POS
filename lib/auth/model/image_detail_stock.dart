class ImageDetailStock {
  int? idImageDetail;
  String? imageDetail;
  int? jumlahStock;
  int? price;
  String? nameVarian;

  ImageDetailStock({
    this.idImageDetail,
    this.imageDetail,
    this.price,
    this.jumlahStock,
    this.nameVarian
});
  factory ImageDetailStock.fromJson(Map<String, dynamic> json) {
    return ImageDetailStock(
      idImageDetail: json["idDetailStock"] ?? 0,
      imageDetail: json["image"] ?? '',
      price: json["price"] ?? 0,
      jumlahStock: json["jumlah_stock"] ?? 0,
      nameVarian: json["nameVarian"] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "idDetailStock" : idImageDetail,
      "image" : imageDetail,
      "price" : price,
      "jumlah_stock" : jumlahStock,
      "nameVarian": nameVarian
    };
  }
}