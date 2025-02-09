import '../../domain/domain.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    required super.name,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['nome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
    };
  }
}
