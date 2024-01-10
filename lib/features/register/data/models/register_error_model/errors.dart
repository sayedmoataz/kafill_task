import 'package:equatable/equatable.dart';

class Errors extends Equatable {
	final List<String>? firstName;
	final List<String>? lastName;
	final List<String>? about;
	final List<String>? tags;
	final List<String>? favoriteSocialMedia;
	final List<String>? salary;
	final List<String>? password;
	final List<String>? email;
	final List<String>? birthDate;
	final List<String>? type;

	const Errors({
		this.firstName, 
		this.lastName, 
		this.about, 
		this.tags, 
		this.favoriteSocialMedia, 
		this.salary, 
		this.password, 
		this.email, 
		this.birthDate, 
		this.type, 
	});

	factory Errors.fromJson(Map<String, dynamic> json) => Errors(
				firstName: json['first_name'] as List<String>?,
				lastName: json['last_name'] as List<String>?,
				about: json['about'] as List<String>?,
				tags: json['tags'] as List<String>?,
				favoriteSocialMedia: json['favorite_social_media'] as List<String>?,
				salary: json['salary'] as List<String>?,
				password: json['password'] as List<String>?,
				email: json['email'] as List<String>?,
				birthDate: json['birth_date'] as List<String>?,
				type: json['type'] as List<String>?,
			);

	Map<String, dynamic> toJson() => {
				'first_name': firstName,
				'last_name': lastName,
				'about': about,
				'tags': tags,
				'favorite_social_media': favoriteSocialMedia,
				'salary': salary,
				'password': password,
				'email': email,
				'birth_date': birthDate,
				'type': type,
			};

	@override
	List<Object?> get props {
		return [
				firstName,
				lastName,
				about,
				tags,
				favoriteSocialMedia,
				salary,
				password,
				email,
				birthDate,
				type,
		];
	}
}
