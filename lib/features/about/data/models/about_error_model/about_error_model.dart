import 'package:equatable/equatable.dart';

import 'error.dart';

class AboutErrorModel extends Equatable {
  final int? status;
  final bool? success;
  final Error? error;

  const AboutErrorModel({this.status, this.success, this.error});

  factory AboutErrorModel.fromJson(Map<String, dynamic> json) {
    return AboutErrorModel(
      status: json['status'] as int?,
      success: json['success'] as bool?,
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'error': error?.toJson(),
      };

  @override
  List<Object?> get props => [status, success, error];
}
