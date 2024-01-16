import 'package:equatable/equatable.dart';

import 'links.dart';

class Pagination extends Equatable {
  final int? count;
  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;
  final Links? links;

  const Pagination({
    this.count,
    this.total,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        count: json['count'] as int?,
        total: json['total'] as int?,
        perPage: json['perPage'] as int?,
        currentPage: json['currentPage'] as int?,
        totalPages: json['totalPages'] as int?,
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'total': total,
        'perPage': perPage,
        'currentPage': currentPage,
        'totalPages': totalPages,
        'links': links?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      count,
      total,
      perPage,
      currentPage,
      totalPages,
      links,
    ];
  }
}
