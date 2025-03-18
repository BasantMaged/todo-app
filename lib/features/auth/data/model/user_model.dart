class AuthResponseModel {
  String? accessToken;
  String? refreshToken;
  bool? status;
  UserModel? user;

  AuthResponseModel({
    this.accessToken,
    this.refreshToken,
    this.status,
    this.user,
  });

  // Factory method to create an instance from JSON
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      status: json['status'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'status': status,
      'user': user?.toJson(),
    };
  }
}

// User Model
class UserModel {
  int? id;
  String? username;
  String? password;

  UserModel({this.id, this.username, this.password});

  // Factory method to create an instance from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'password': password};
  }
}
