class Cart {
  int? idCart;
  int? idUser;
  int? quantity;
  String? image;
  String? nameProduct;
  String? userName;
  int? jumlahStock;
  int? jumlahStockAwal;
  int? hargaAwal;
  int? total;

  Cart({
    this.idCart,
    this.idUser,
    this.jumlahStock,
    this.nameProduct,
    this.total,
    this.userName,
    this.quantity,
    this.image,
    this.jumlahStockAwal,
    this.hargaAwal
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart (
        idCart: json["idChart"] ?? 0,
        idUser: json["userId"] ?? 0,
        nameProduct: json["name"] ?? '',
        userName: json["userName"] ?? '',
        jumlahStock: json["jumlah_stock"] ?? 0,
        total: json["total"] ?? 0,
        quantity: json["quantity"] ?? 0,
        image: json["image"] ?? "No image showen",
        jumlahStockAwal: json["jumlah_awal"] ?? 0,
        hargaAwal: json["harga_awal"] ?? 0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "idChart": idCart,
      "userId": idUser,
      "name": nameProduct,
      "userName": userName,
      "jumlah_stock": jumlahStock,
      "total": total,
      "quantity": quantity,
      "image": image,
      "jumlah_awal": jumlahStockAwal,
      "harga_awal": hargaAwal
    };
  }

}