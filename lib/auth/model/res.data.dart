import 'meta.data.dart';

class ResData<T> {
  MetaData? metaData;
  T data;

  ResData({required this.metaData, required this.data});

  factory ResData.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ResData(
      metaData: MetaData.fromJson(json['metaData']),
      data: fromJsonT(json['response']),
    );
  }
}