import '../../domain/domain.dart';
import 'models.dart';

class SuiteModel extends SuiteEntity {
  SuiteModel({
    required super.name,
    required super.quantity,
    required super.showAvailable,
    required super.photos,
    required List<ItemModel> super.items,
    required List<ItemCategoryModel> super.categories,
    required List<PeriodModel> super.periods,
  });

  factory SuiteModel.fromJson(Map<String, dynamic> json) {
    return SuiteModel(
      name: json['nome'],
      quantity: json['qtd'],
      showAvailable: json['exibirQtdDisponiveis'],
      photos: List<String>.from(json['fotos']),
      items: List<ItemModel>.from(
        json['itens'].map((x) => ItemModel.fromJson(x)),
      ),
      categories: List<ItemCategoryModel>.from(
        json['categoriaItens'].map((x) => ItemCategoryModel.fromJson(x)),
      ),
      periods: List<PeriodModel>.from(
        json['periodos'].map((x) => PeriodModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'qtd': quantity,
      'exibirQtdDisponiveis': showAvailable,
      'fotos': photos,
      'itens': (items as List<ItemModel>).map((x) => x.toJson()).toList(),
      'categoriaItens': (categories as List<ItemCategoryModel>)
          .map((x) => x.toJson())
          .toList(),
      'periodos':
          (periods as List<PeriodModel>).map((x) => x.toJson()).toList(),
    };
  }
}
