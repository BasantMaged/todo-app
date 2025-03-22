// ProfileModel & ChangePasswordModel

class ProfileModel {
  final String username;
  final String imageUrl;

  ProfileModel({required this.username, required this.imageUrl});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      username: json['username'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'imageUrl': imageUrl};
  }
}

class ChangePasswordModel {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'current_password': oldPassword,
      'new_password': newPassword,
      'new_password_confirm': confirmPassword,
    };
  }
}
