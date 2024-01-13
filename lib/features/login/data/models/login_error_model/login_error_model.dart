import 'package:equatable/equatable.dart';

import 'errors.dart';

class LoginErrorModel extends Equatable {
  final String? message;
  final Errors? errors;

  const LoginErrorModel({this.message, this.errors});

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) {
    return LoginErrorModel(
      message: json['message'] as String?,
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'errors': errors?.toJson(),
      };

  @override
  List<Object?> get props => [message, errors];
}
