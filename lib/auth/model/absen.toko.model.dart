class AbsenTokoModel {
  int? id_absen_toko;
  String? keterangan;
  int? latitude;
  int? longitude;

  AbsenTokoModel({
    this.id_absen_toko,
    this.keterangan,
    this.longitude,
    this.latitude
});
  factory AbsenTokoModel.fromJson(Map<String, dynamic> json) {
    return AbsenTokoModel(
      id_absen_toko: json["absen_toko_id"] ?? 0,
      keterangan: json["keterangan"] ?? '',
      latitude: json["latitude"] ?? 0,
      longitude: json["longitude"] ?? 0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "absen_toko_id" : id_absen_toko,
      "keterangan" : keterangan,
      "latitude": latitude,
      "longitude": longitude
    };
  }
}