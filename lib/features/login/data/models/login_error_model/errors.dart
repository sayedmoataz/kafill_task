import 'package:equatable/equatable.dart';

class Errors extends Equatable {
  final List<String>? password;

  const Errors({this.password});

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        password: json['password'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'password': password,
      };

  @override
  List<Object?> get props => [password];
}
