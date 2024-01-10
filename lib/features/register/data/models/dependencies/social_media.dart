import 'package:equatable/equatable.dart';

class SocialMedia extends Equatable {
	final String? value;
	final String? label;

	const SocialMedia({this.value, this.label});

	factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
				value: json['value'] as String?,
				label: json['label'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'value': value,
				'label': label,
			};

	@override
	List<Object?> get props => [value, label];
}
