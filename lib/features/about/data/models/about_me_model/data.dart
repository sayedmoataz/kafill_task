import 'package:equatable/equatable.dart';

import 'tag.dart';
import 'type.dart';

class Data extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? about;
  final List<Tag>? tags;
  final List<dynamic>? favoriteSocialMedia;
  final int? salary;
  final String? email;
  final String? birthDate;
  final int? gender;
  final Type? type;
  final String? avatar;

  const Data({
    this.id,
    this.firstName,
    this.lastName,
    this.about,
    this.tags,
    this.favoriteSocialMedia,
    this.salary,
    this.email,
    this.birthDate,
    this.gender,
    this.type,
    this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        about: json['about'] as String?,
        tags: (json['tags'] as List<dynamic>?)
            ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
            .toList(),
        favoriteSocialMedia: json['favorite_social_media'],
        salary: json['salary'] as int?,
        email: json['email'] as String?,
        birthDate: json['birth_date'] as String?,
        gender: json['gender'] as int?,
        type: json['type'] == null
            ? null
            : Type.fromJson(json['type'] as Map<String, dynamic>),
        avatar: json['avatar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'about': about,
        'tags': tags?.map((e) => e.toJson()).toList(),
        'favorite_social_media': favoriteSocialMedia,
        'salary': salary,
        'email': email,
        'birth_date': birthDate,
        'gender': gender,
        'type': type?.toJson(),
        'avatar': avatar,
      };

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      about,
      tags,
      favoriteSocialMedia,
      salary,
      email,
      birthDate,
      gender,
      type,
      avatar,
    ];
  }
}
