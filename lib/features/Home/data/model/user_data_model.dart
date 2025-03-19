class UserDataModel {
  final bool? status;
  final User? user;

  UserDataModel({this.status, this.user});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      status: json['status'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'user': user?.toJson(),
    };
  }
}

class User {
  final int? id;
  final String? imagePath;
  final String? username;

  User({this.id, this.imagePath, this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      imagePath: json['image_path'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_path': imagePath,
      'username': username,
    };
  }
}
