class ApiUserModel {
  final String id;
  final String name;
  final String email;
  final String token;

  ApiUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory ApiUserModel.fromJson(Map<String, dynamic> json) {
    return ApiUserModel(
      id: json['id'] ?? json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
