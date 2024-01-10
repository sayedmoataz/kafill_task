import 'package:equatable/equatable.dart';

class Tag extends Equatable {
	final int? value;
	final String? label;

	const Tag({this.value, this.label});

	factory Tag.fromJson(Map<String, dynamic> json) => Tag(
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
