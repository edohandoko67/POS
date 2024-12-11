class SatuanProduct{
  int? id_satuan;
  String? satuan_product;
  String? kode_product;

  SatuanProduct({
    this.id_satuan,
    this.satuan_product,
    this.kode_product
  });
  factory SatuanProduct.fromJson(Map<String, dynamic>json) {
    return SatuanProduct(
        id_satuan: json['id_satuan'] ?? 0,
        satuan_product: json['satuan_product'] ?? '',
        kode_product: json['kode_product'] ?? ''
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id_satuan': id_satuan,
      'satuan_product': satuan_product,
      'kode_product': kode_product
    };
  }
}