import 'package:equatable/equatable.dart';

class Datum extends Equatable {
	final int? id;
	final String? countryCode;
	final String? name;
	final String? capital;

	const Datum({this.id, this.countryCode, this.name, this.capital});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				countryCode: json['country_code'] as String?,
				name: json['name'] as String?,
				capital: json['capital'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'country_code': countryCode,
				'name': name,
				'capital': capital,
			};

	@override
	List<Object?> get props => [id, countryCode, name, capital];
}
