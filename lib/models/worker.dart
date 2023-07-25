import 'dart:convert';

import 'package:fyp/models/rating.dart';

class Worker {
  final String name;
  final String description;
  final double fee;
  final String gender;
  final String profilePicture;
  final String? id;
  final List<Rating>? rating;

  Worker({
    required this.name,
    required this.description,
    required this.fee,
    required this.gender,
    required this.profilePicture,
    this.id,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'fee': fee,
      'gender': gender,
      'profilePicture': profilePicture,
      'id': id,
      'rating': rating,
    };
  }

  factory Worker.fromMap(Map<String, dynamic> map) {
    return Worker(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      fee: map['fee']?.toDouble() ?? 0.0,
      gender: map['gender'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      id: map['_id'],
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Worker.fromJson(String source) => Worker.fromMap(
        json.decode(source),
      );
}
