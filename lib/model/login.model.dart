class LoginModel {
  int? idUser;
  String? username;
  String? password;
  String? accessToken;
  String? role_user;
  String? number;
  int? gender;

  LoginModel({
    this.idUser,
    this.username,
    this.password,
    this.accessToken,
    this.role_user,
    this.number,
    this.gender
});

  bool get isSuccess => accessToken?.isNotEmpty ?? false;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      idUser: json["idUser"] ?? 0,
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      accessToken: json['accessToken'] ?? '',
      role_user: json['role'] ?? '',
      number: json['number'] ?? '',
      gender: json['gender'] ?? 0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'username': username,
      'password': password,
      'accessToken': accessToken,
      'role': role_user,
      'number': number,
      'gender': gender
    };
  }

}