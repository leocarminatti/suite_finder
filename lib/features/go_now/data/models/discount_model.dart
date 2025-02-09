import '../../domain/domain.dart';

class DiscountModel extends DiscountEntity {
  DiscountModel({
    required super.value,
  });

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return DiscountModel(
      value: json['desconto'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'desconto': value,
    };
  }
}
