import 'package:equatable/equatable.dart';

class Tag extends Equatable {
  final int? id;
  final String? name;

  const Tag({this.id, this.name});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
