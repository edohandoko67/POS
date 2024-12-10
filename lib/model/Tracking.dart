import 'package:intl/intl.dart';

class Tracking {
  int? idTracking;
  String? nameProduct;
  String? status;
  String? noResi;
  DateTime? date;
  String? nameSales;
  bool? checkData;
  bool? checkDataAfter;
  List<HistoryStatus>? historyStatus;
  static final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  Tracking({
    this.nameProduct,
    this.idTracking,
    this.status,
    this.date,
    this.noResi,
    this.nameSales,
    this.checkData,
    this.checkDataAfter,
    this.historyStatus
  });
  factory Tracking.fromJson(Map<String, dynamic> json) {
    String? dateString = json["timestamp"];
    DateTime? parsedDate;

    if (dateString != null) {
      try {
        parsedDate = DateTime.parse(dateString); // Parse ISO 8601 date string
      } catch (e) {
        print('Error parsing date: $e');
      }
    }
    return Tracking(
      idTracking: json["id_tracking"] ?? 0,
      nameProduct: json["nameProduct"] ?? '',
      status: json["status"] ?? '',
      date: parsedDate,
      noResi: json["noResi"] ?? '',
      nameSales: json["name_sales"] ?? '',
      checkData: json["checkingData"] as bool? ?? false,
      checkDataAfter: json["checkingDataAfter"] as bool,
      historyStatus: (json["histories"] as List<dynamic>?)
          ?.map((item) => HistoryStatus.fromJson(item))
          .toList() ?? [], // Handle null and convert to List<HistoryStatus>
    );
  }
  Map<String, dynamic> toJson() {
    String? formattedDate = date != null ? dateFormat.format(date!) : null;
    return {
      "id_tracking": idTracking,
      "nameProduct": nameProduct,
      "status": status,
      "timestamp": formattedDate,
      "noResi": noResi,
      "name_sales": nameSales,
      "checkingData": checkData,
      "checkingDataAfter": checkDataAfter,
      "histories": historyStatus
    };
  }
}

class HistoryStatus {
  int? idHistory;
  String? statusHistory;
  DateTime? localDateStatus;
  bool? checkHistory;
  static final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  HistoryStatus({
    this.idHistory,
    this.localDateStatus,
    this.statusHistory,
    this.checkHistory
  });
  factory HistoryStatus.fromJson(Map<String, dynamic> json) {
    String? dateString = json["localDateTime"];
    DateTime? parsedDate;

    if (dateString != null) {
      try {
        parsedDate = DateTime.parse(dateString); // Parse ISO 8601 date string
      } catch (e) {
        print('Error parsing date: $e');
      }
    }
    return HistoryStatus(
        idHistory: json["idHistory"] ?? 0,
        localDateStatus: parsedDate,
        statusHistory: json["status"] ?? '',
        checkHistory: json["checkHistory"] ?? false
    );
  }

  Map<String, dynamic> toJson() {
    String? formattedDate = localDateStatus != null ? dateFormat.format(localDateStatus!) : null;
    return {
      "idHistory": idHistory,
      "localDateTime": formattedDate,
      "status": statusHistory,
      "checkHistory": checkHistory
    };
  }

}