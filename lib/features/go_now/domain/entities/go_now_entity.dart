class GoNowDataEntity {
  final int page;
  final int itemsPerPage;
  final int totalSuites;
  final int totalMotels;
  final double radius;
  final double maxPages;
  final List<MotelEntity> motels;

  GoNowDataEntity({
    required this.page,
    required this.itemsPerPage,
    required this.totalSuites,
    required this.totalMotels,
    required this.radius,
    required this.maxPages,
    required this.motels,
  });
}

class MotelEntity {
  final String name;
  final String logo;
  final String neighborhood;
  final double distance;
  final int favoritesCount;
  final List<SuiteEntity> suites;
  final int reviewsCount;
  final double rating;

  MotelEntity({
    required this.name,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.favoritesCount,
    required this.suites,
    required this.reviewsCount,
    required this.rating,
  });
}

class SuiteEntity {
  final String name;
  final int quantity;
  final bool showAvailable;
  final List<String> photos;
  final List<ItemEntity> items;
  final List<ItemCategoryEntity> categories;
  final List<PeriodEntity> periods;

  SuiteEntity({
    required this.name,
    required this.quantity,
    required this.showAvailable,
    required this.photos,
    required this.items,
    required this.categories,
    required this.periods,
  });
}

class ItemEntity {
  final String name;

  ItemEntity({
    required this.name,
  });
}

class ItemCategoryEntity {
  final String name;
  final String icon;

  ItemCategoryEntity({
    required this.name,
    required this.icon,
  });
}

class PeriodEntity {
  final String formattedTime;
  final String time;
  final double price;
  final double totalPrice;
  final bool hasCourtesy;
  final DiscountEntity? discount;

  PeriodEntity({
    required this.formattedTime,
    required this.time,
    required this.price,
    required this.totalPrice,
    required this.hasCourtesy,
    this.discount,
  });
}

class DiscountEntity {
  final double value;

  DiscountEntity({
    required this.value,
  });
}
