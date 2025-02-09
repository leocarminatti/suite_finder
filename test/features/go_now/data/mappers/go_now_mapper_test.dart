import 'package:flutter_test/flutter_test.dart';
import 'package:suite_finder/features/go_now/data/data.dart';

import '../../../../mocks/object_mock.dart';

void main() {
  group('GoNowDataMapper', () {
    test('toModel should convert GoNowDataEntity to GoNowDataModel', () {
      // arrange
      final entity = tGoNowData;

      // act
      final model = entity.toModel();

      // assert
      expect(model, isA<GoNowDataModel>());
      expect(model.page, entity.page);
      expect(model.itemsPerPage, entity.itemsPerPage);
      expect(model.totalSuites, entity.totalSuites);
      expect(model.totalMotels, entity.totalMotels);
      expect(model.radius, entity.radius);
      expect(model.maxPages, entity.maxPages);
      expect(model.motels.length, entity.motels.length);
    });
  });

  group('MotelMapper', () {
    test('toModel should convert MotelEntity to MotelModel', () {
      // arrange
      final entity = tMotelEntity;

      // act
      final model = entity.toModel();

      // assert
      expect(model, isA<MotelModel>());
      expect(model.name, entity.name);
      expect(model.logo, entity.logo);
      expect(model.neighborhood, entity.neighborhood);
      expect(model.distance, entity.distance);
      expect(model.favoritesCount, entity.favoritesCount);
      expect(model.suites.length, entity.suites.length);
      expect(model.reviewsCount, entity.reviewsCount);
      expect(model.rating, entity.rating);
    });
  });

  group('SuiteMapper', () {
    test('toModel should convert SuiteEntity to SuiteModel', () {
      // arrange
      final entity = tSuiteEntity;

      // act
      final model = entity.toModel();

      // assert
      expect(model, isA<SuiteModel>());
      expect(model.name, entity.name);
      expect(model.quantity, entity.quantity);
      expect(model.showAvailable, entity.showAvailable);
      expect(model.photos, entity.photos);
      expect(model.items.length, entity.items.length);
      expect(model.categories.length, entity.categories.length);
      expect(model.periods.length, entity.periods.length);
    });
  });

  group('ItemMapper', () {
    test('toModel should convert ItemEntity to ItemModel', () {
      // arrange
      final entity = tItemEntity;

      // act
      final model = entity.toModel();

      // assert
      expect(model, isA<ItemModel>());
      expect(model.name, entity.name);
    });
  });

  group('ItemCategoryMapper', () {
    test('toModel should convert ItemCategoryEntity to ItemCategoryModel', () {
      // arrange
      final entity = tItemCategoryEntity;

      // act
      final model = entity.toModel();

      // assert
      expect(model, isA<ItemCategoryModel>());
      expect(model.name, entity.name);
      expect(model.icon, entity.icon);
    });
  });

  group('PeriodMapper', () {
    test('toModel should convert PeriodEntity to PeriodModel', () {
      // arrange
      final entity = tPeriodEntity;

      // act
      final model = entity.toModel();

      // assert
      expect(model, isA<PeriodModel>());
      expect(model.formattedTime, entity.formattedTime);
      expect(model.time, entity.time);
      expect(model.price, entity.price);
      expect(model.totalPrice, entity.totalPrice);
      expect(model.hasCourtesy, entity.hasCourtesy);
      expect(model.discount?.value, entity.discount?.value);
    });

    test('toModel should handle null discount', () {
      // arrange
      final entity = tPeriodEntityWithoutDiscount;

      // act
      final model = entity.toModel();

      // assert
      expect(model.discount, isNull);
    });
  });

  group('DiscountMapper', () {
    test('toModel should convert DiscountEntity to DiscountModel', () {
      // arrange
      final entity = tDiscountEntity;

      // act
      final model = entity.toModel();

      // assert
      expect(model, isA<DiscountModel>());
      expect(model.value, entity.value);
    });
  });
}
