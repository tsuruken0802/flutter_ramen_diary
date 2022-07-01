import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FSUserDto extends Equatable {
  final String name;
  final String? iconUrl;

  const FSUserDto({
    required this.name,
    this.iconUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iconUrl': iconUrl,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  FSUserDto copyWith({
    String? name,
    String? iconUrl,
  }) {
    return FSUserDto(
      name: name ?? this.name,
      iconUrl: iconUrl ?? this.iconUrl,
    );
  }

  @override
  List<Object?> get props => [
        name,
        iconUrl,
      ];
}
