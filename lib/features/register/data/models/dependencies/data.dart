import 'package:equatable/equatable.dart';

import 'social_media.dart';
import 'tag.dart';
import 'type.dart';

class Data extends Equatable {
	final List<Type>? types;
	final List<Tag>? tags;
	final List<SocialMedia>? socialMedia;

	const Data({this.types, this.tags, this.socialMedia});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				types: (json['types'] as List<dynamic>?)
						?.map((e) => Type.fromJson(e as Map<String, dynamic>))
						.toList(),
				tags: (json['tags'] as List<dynamic>?)
						?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
						.toList(),
				socialMedia: (json['social_media'] as List<dynamic>?)
						?.map((e) => SocialMedia.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'types': types?.map((e) => e.toJson()).toList(),
				'tags': tags?.map((e) => e.toJson()).toList(),
				'social_media': socialMedia?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [types, tags, socialMedia];
}
