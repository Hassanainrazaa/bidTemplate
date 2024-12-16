class User {
  final bool status;
  final AuthData data;

  User({required this.status, required this.data});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      status: json['status'],
      data: AuthData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class AuthData {
  final String token;

  AuthData({required this.token});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
