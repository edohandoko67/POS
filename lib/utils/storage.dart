import 'package:get_storage/get_storage.dart';

class Storage {
  final GetStorage _storage = GetStorage();

  void saveToken(String token) => _storage.write("accessToken", token);
  void saveName(String name) => _storage.write("name", name);
  void saveId(int idUser) => _storage.write("id_user", idUser);
  void saveNumber(String number) => _storage.write("number", number);
  void saveGender(int gender) => _storage.write("gender", gender);
  void saveRole(String role) => _storage.write("role", role);
  void savePassword(String password) => _storage.write("password", password);
  void login() => _storage.write("isLoggedIn", true);
  void logout() => _storage.write("isLoggedIn", false);

  bool isLogin() => _storage.read<bool>("isLoggedIn") ?? false;
  String? getToken() => _storage.read<String>("accessToken");
  String? getName() => _storage.read<String>("name");
  String? getRole() => _storage.read<String>("role");
  String? getNumber() => _storage.read<String>("number");
  int? getGender() => _storage.read<int>("gender");
  String? getPassword() => _storage.read<String>("password");
  int? getId() => _storage.read<int>("id_user");

}