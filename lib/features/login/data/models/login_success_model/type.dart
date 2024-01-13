import 'package:equatable/equatable.dart';

class Type extends Equatable {
  final int? code;
  final String? name;
  final String? niceName;

  const Type({this.code, this.name, this.niceName});

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        code: json['code'] as int?,
        name: json['name'] as String?,
        niceName: json['nice_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'nice_name': niceName,
      };

  @override
  List<Object?> get props => [code, name, niceName];
}
