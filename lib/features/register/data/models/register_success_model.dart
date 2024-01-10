import 'package:equatable/equatable.dart';

class RegisterSuccessModel extends Equatable {
	final int? status;
	final bool? success;
	final dynamic data;

	const RegisterSuccessModel({this.status, this.success, this.data});

	factory RegisterSuccessModel.fromJson(Map<String, dynamic> json) {
		return RegisterSuccessModel(
			status: json['status'] as int?,
			success: json['success'] as bool?,
			data: json['data'] as dynamic,
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'success': success,
				'data': data,
			};

	@override
	List<Object?> get props => [status, success, data];
}
