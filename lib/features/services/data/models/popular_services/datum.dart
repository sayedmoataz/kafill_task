import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final String? mainImage;
  final int? price;
  final dynamic discount;
  final int? priceAfterDiscount;
  final String? title;
  final int? averageRating;
  final int? completedSalesCount;
  final bool? recommended;

  const Datum({
    this.id,
    this.mainImage,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.title,
    this.averageRating,
    this.completedSalesCount,
    this.recommended,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        mainImage: json['main_image'] as String?,
        price: json['price'] as int?,
        discount: json['discount'] as dynamic,
        priceAfterDiscount: json['price_after_discount'] as int?,
        title: json['title'] as String?,
        averageRating: json['average_rating'] as int?,
        completedSalesCount: json['completed_sales_count'] as int?,
        recommended: json['recommended'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main_image': mainImage,
        'price': price,
        'discount': discount,
        'price_after_discount': priceAfterDiscount,
        'title': title,
        'average_rating': averageRating,
        'completed_sales_count': completedSalesCount,
        'recommended': recommended,
      };

  @override
  List<Object?> get props {
    return [
      id,
      mainImage,
      price,
      discount,
      priceAfterDiscount,
      title,
      averageRating,
      completedSalesCount,
      recommended,
    ];
  }
}
