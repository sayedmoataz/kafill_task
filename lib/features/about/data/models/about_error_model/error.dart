import 'package:equatable/equatable.dart';

class Error extends Equatable {
	final int? code;
	final String? message;

	const Error({this.code, this.message});

	factory Error.fromJson(Map<String, dynamic> json) => Error(
				code: json['code'] as int?,
				message: json['message'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'code': code,
				'message': message,
			};

	@override
	List<Object?> get props => [code, message];
}
