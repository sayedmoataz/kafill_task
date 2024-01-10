import 'package:equatable/equatable.dart';

import 'errors.dart';

class RegisterErrorModel extends Equatable {
	final String? message;
	final Errors? errors;

	const RegisterErrorModel({this.message, this.errors});

	factory RegisterErrorModel.fromJson(Map<String, dynamic> json) {
		return RegisterErrorModel(
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
