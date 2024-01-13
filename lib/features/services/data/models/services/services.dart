import 'package:equatable/equatable.dart';

import 'datum.dart';

class Services extends Equatable {
  final int? status;
  final bool? success;
  final List<Datum>? data;

  const Services({this.status, this.success, this.data});

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        status: json['status'] as int?,
        success: json['success'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, success, data];
}
