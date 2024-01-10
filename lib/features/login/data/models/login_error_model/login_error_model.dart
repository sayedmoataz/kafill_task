import 'package:equatable/equatable.dart';

import 'error.dart';

class LoginErrorModel extends Equatable {
	final int? status;
	final bool? success;
	final Error? error;

	const LoginErrorModel({this.status, this.success, this.error});

	factory LoginErrorModel.fromJson(Map<String, dynamic> json) {
		return LoginErrorModel(
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
