import 'package:equatable/equatable.dart';

import 'datum.dart';

class PopularServicesModel extends Equatable {
  final int? status;
  final bool? success;
  final List<Datum>? data;

  const PopularServicesModel({this.status, this.success, this.data});

  factory PopularServicesModel.fromJson(Map<String, dynamic> json) {
    return PopularServicesModel(
      status: json['status'] as int?,
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, success, data];
}
