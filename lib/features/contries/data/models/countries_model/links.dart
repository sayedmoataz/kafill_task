import 'package:equatable/equatable.dart';

class Links extends Equatable {
  final String? next;

  const Links({this.next});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        next: json['next'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'next': next,
      };

  @override
  List<Object?> get props => [next];
}
