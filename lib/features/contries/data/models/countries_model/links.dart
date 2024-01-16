import 'package:equatable/equatable.dart';

class Links extends Equatable {
  final String? previous;
  final String? next;

  const Links({this.previous, this.next});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        previous: json['previous'] as String?,
        next: json['next'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'previous': previous,
        'next': next,
      };

  @override
  List<Object?> get props => [previous, next];
}
