import '../../domain/domain.dart';
import 'models.dart';

class PeriodModel extends PeriodEntity {
  PeriodModel({
    required super.formattedTime,
    required super.time,
    required super.price,
    required super.totalPrice,
    required super.hasCourtesy,
    super.discount,
  });

  factory PeriodModel.fromJson(Map<String, dynamic> json) {
    return PeriodModel(
      formattedTime: json['tempoFormatado'],
      time: json['tempo'],
      price: json['valor'].toDouble(),
      totalPrice: json['valorTotal'].toDouble(),
      hasCourtesy: json['temCortesia'],
      discount: json['desconto'] != null
          ? DiscountModel.fromJson(json['desconto'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tempoFormatado': formattedTime,
      'tempo': time,
      'valor': price,
      'valorTotal': totalPrice,
      'temCortesia': hasCourtesy,
      'desconto':
          discount != null ? (discount as DiscountModel).toJson() : null,
    };
  }
}
