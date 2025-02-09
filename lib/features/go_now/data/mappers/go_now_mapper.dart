import '../../domain/entities/go_now_entity.dart';
import '../data.dart';

extension GoNowDataMapper on GoNowDataEntity {
  GoNowDataModel toModel() {
    return GoNowDataModel(
      page: page,
      itemsPerPage: itemsPerPage,
      totalSuites: totalSuites,
      totalMotels: totalMotels,
      radius: radius,
      maxPages: maxPages,
      motels: motels.map((e) => e.toModel()).toList(),
    );
  }
}

extension MotelMapper on MotelEntity {
  MotelModel toModel() {
    return MotelModel(
      name: name,
      logo: logo,
      neighborhood: neighborhood,
      distance: distance,
      favoritesCount: favoritesCount,
      suites: suites.map((e) => e.toModel()).toList(),
      reviewsCount: reviewsCount,
      rating: rating,
    );
  }
}

extension SuiteMapper on SuiteEntity {
  SuiteModel toModel() {
    return SuiteModel(
      name: name,
      quantity: quantity,
      showAvailable: showAvailable,
      photos: photos,
      items: items.map((e) => e.toModel()).toList(),
      categories: categories.map((e) => e.toModel()).toList(),
      periods: periods.map((e) => e.toModel()).toList(),
    );
  }
}

extension ItemMapper on ItemEntity {
  ItemModel toModel() {
    return ItemModel(name: name);
  }
}

extension ItemCategoryMapper on ItemCategoryEntity {
  ItemCategoryModel toModel() {
    return ItemCategoryModel(
      name: name,
      icon: icon,
    );
  }
}

extension PeriodMapper on PeriodEntity {
  PeriodModel toModel() {
    return PeriodModel(
      formattedTime: formattedTime,
      time: time,
      price: price,
      totalPrice: totalPrice,
      hasCourtesy: hasCourtesy,
      discount: discount?.toModel(),
    );
  }
}

extension DiscountMapper on DiscountEntity {
  DiscountModel toModel() {
    return DiscountModel(value: value);
  }
}
