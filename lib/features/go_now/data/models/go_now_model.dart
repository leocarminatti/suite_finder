import '../../domain/entities/go_now_entity.dart';
import 'motel_model.dart';

class GoNowDataModel extends GoNowDataEntity {
  GoNowDataModel({
    required super.page,
    required super.itemsPerPage,
    required super.totalSuites,
    required super.totalMotels,
    required super.radius,
    required super.maxPages,
    required super.motels,
  });

  factory GoNowDataModel.fromJson(Map<String, dynamic> json) {
    return GoNowDataModel(
      page: json['pagina'],
      itemsPerPage: json['qtdPorPagina'],
      totalSuites: json['totalSuites'],
      totalMotels: json['totalMoteis'],
      radius: json['raio'].toDouble(),
      maxPages: json['maxPaginas'].toDouble(),
      motels: List<MotelModel>.from(
        json['moteis'].map((x) => MotelModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagina': page,
      'qtdPorPagina': itemsPerPage,
      'totalSuites': totalSuites,
      'totalMoteis': totalMotels,
      'raio': radius,
      'maxPaginas': maxPages,
      'moteis': (motels as List<MotelModel>).map((x) => x.toJson()).toList(),
    };
  }
}
