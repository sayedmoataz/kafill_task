import 'package:equatable/equatable.dart';

class Type extends Equatable {
	final int? value;
	final String? label;

	const Type({this.value, this.label});

	factory Type.fromJson(Map<String, dynamic> json) => Type(
				value: json['value'] as int?,
				label: json['label'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'value': value,
				'label': label,
			};

	@override
	List<Object?> get props => [value, label];
}
