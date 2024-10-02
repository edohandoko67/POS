class ApiConstant {
  ApiConstant._();

  static const String baseUrl = 'http://192.168.2.213:8080/';
  static const String baseUrlNotification = 'https://onesignal.com/api/v1/';

  static const String login = '${baseUrl}login';
  static const String listProduct = '${baseUrl}product/list';
  static const String listSatuanProduct = '${baseUrl}satuan_product/list';
  static const String createProductRetur = '${baseUrl}product/create';
  static const String deleteProductRetur = '${baseUrl}product/delete';
  static const String listToko = '${baseUrl}Toko/listId';
  static const String createAbsenToko = '${baseUrl}absen_toko/create';
  static const String stockProduct = '${baseUrl}stock/list';
  static const String listKurir = '${baseUrl}jadwal_sales/list';
  static const String trackingProduct = '${baseUrl}tracking/noResi';
  static const String listTrackingProduct = '${baseUrl}tracking/list';
  static const String listIdDetailStock = '${baseUrl}detail_stock_image/list_image';
  static const String createCart = '${baseUrl}cart/create';
  static const String findCartById = '${baseUrl}cart/list';
  static const String notifikasi = '${baseUrl}pesan/list';
}