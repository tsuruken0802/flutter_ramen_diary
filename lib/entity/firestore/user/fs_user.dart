import 'package:cloud_firestore/cloud_firestore.dart';

class FSUser {
  final String id;

  final String name;

  final String iconUrl;

  final Timestamp createdAt;

  final Timestamp updatedAt;

  FSUser({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FSUser.fromJson(Map<String, dynamic> json) {
    return FSUser(
      id: json['id'] as String,
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String,
      createdAt: json['createdAt'] as Timestamp,
      updatedAt: json['updatedAt'] as Timestamp,
    );
  }
}
