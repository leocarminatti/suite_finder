import '../../domain/domain.dart';
import 'models.dart';

class MotelModel extends MotelEntity {
  MotelModel({
    required super.name,
    required super.logo,
    required super.neighborhood,
    required super.distance,
    required super.favoritesCount,
    required super.suites,
    required super.reviewsCount,
    required super.rating,
  });

  factory MotelModel.fromJson(Map<String, dynamic> json) {
    return MotelModel(
      name: json['fantasia'],
      logo: json['logo'],
      neighborhood: json['bairro'],
      distance: json['distancia'],
      favoritesCount: json['qtdFavoritos'],
      suites: List<SuiteModel>.from(
        json['suites'].map((x) => SuiteModel.fromJson(x)),
      ),
      reviewsCount: json['qtdAvaliacoes'],
      rating: json['media'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fantasia': name,
      'logo': logo,
      'bairro': neighborhood,
      'distancia': distance,
      'qtdFavoritos': favoritesCount,
      'suites': (suites as List<SuiteModel>).map((x) => x.toJson()).toList(),
      'qtdAvaliacoes': reviewsCount,
      'media': rating,
    };
  }
}
