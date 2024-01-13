import 'package:equatable/equatable.dart';

import 'data.dart';

class LoginSuccessModel extends Equatable {
  final int? status;
  final bool? success;
  final Data? data;
  final String? accessToken;

  const LoginSuccessModel({
    this.status,
    this.success,
    this.data,
    this.accessToken,
  });

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) {
    return LoginSuccessModel(
      status: json['status'] as int?,
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'data': data?.toJson(),
        'access_token': accessToken,
      };

  @override
  List<Object?> get props => [status, success, data, accessToken];
}
