class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String? biography;
  final String? imageUrl;
  final bool isOnline;
  final DateTime dateCreated;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.biography,
    this.imageUrl,
    required this.isOnline,
    required this.dateCreated,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      biography: json['biography'] as String?,
      imageUrl: json['imageUrl'] as String?,
      isOnline: json['isOnline'] ?? false,
      dateCreated: json['dateCreate'] as DateTime,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'biography': biography,
        'imageUrl': imageUrl,
        'isOnline': isOnline,
        'dateCreated': dateCreated,
      };
}