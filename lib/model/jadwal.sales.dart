class JadwalSales {
  int? idSales;
  String? name;
  String? toko;
  String? kode;

  JadwalSales({
    this.idSales,
    this.name,
    this.kode,
    this.toko
});
  factory JadwalSales.fromJson(Map<String, dynamic> json) {
    return JadwalSales(
      idSales: json["jadwalsales_id"] ?? 0,
      name: json["nameSales"] ?? '',
      kode: json["kode"] ?? '',
      toko: json["name_store"] ?? ''
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "jadwalsales_id": idSales,
      "nameSales": name,
      "kode": kode,
      "name_store": toko
    };
  }
}