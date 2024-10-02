class TokoModel {
  int? tokoId;
  String? nameToko;
  String? address;
  String? image;
  String? nomor_so;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? desa;
  String? owner;
  String? number;
  String? image_detail;
  double? latitude;
  double? longitude;

  TokoModel({
    this.tokoId,
    this.nameToko,
    this.address,
    this.nomor_so,
    this.image,
    this.number,
    this.desa,
    this.kecamatan,
    this.kota,
    this.owner,
    this.provinsi,
    this.image_detail,
    this.latitude,
    this.longitude
});

  factory TokoModel.fromJson(Map<String, dynamic> json) {
    return TokoModel(
      tokoId: json["jadwalToko_id"] ?? 0,
      nameToko: json["name_toko"] ?? "",
      address: json["address"] ?? "",
      nomor_so: json["nomer_so"] ?? "",
      image: json["image"] ?? "",
      provinsi: json["provinsi"] ?? "",
      kota: json["kota"] ?? "",
      kecamatan: json["kecamatan"] ?? "",
      desa: json["desa"] ?? "",
      owner: json["namaOwner"] ?? "",
      number: json["number"] ?? "",
      image_detail: json["imageDetail"] ?? "No Image showen",
      latitude: json["latitude"] ?? 0.0,
      longitude: json["longitude"] ?? 0.0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "jadwalToko_id" : tokoId,
      "name_toko": nameToko,
      "address": address,
      "image": image,
      "nomer_so": nomor_so,
      "provinsi": provinsi,
      "kota": kota,
      "kecamatan": kecamatan,
      "desa": desa,
      "namaOwner": owner,
      "number": number,
      "imageDetail": image_detail,
      "latitude": latitude,
      "longitude": longitude
    };
  }
}