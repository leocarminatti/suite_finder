import '../../domain/domain.dart';

class ItemCategoryModel extends ItemCategoryEntity {
  ItemCategoryModel({
    required super.name,
    required super.icon,
  });

  factory ItemCategoryModel.fromJson(Map<String, dynamic> json) {
    return ItemCategoryModel(
      name: json['nome'],
      icon: json['icone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'icone': icon,
    };
  }
}
