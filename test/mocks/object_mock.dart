import 'package:suite_finder/features/go_now/go_now.dart';

final tGoNowDataModel = GoNowDataModel(
  page: 1,
  itemsPerPage: 10,
  totalSuites: 0,
  totalMotels: 1,
  radius: 0,
  maxPages: 1.0,
  motels: [],
);

// final tGoNowData = GoNowDataEntity(
//   page: 1,
//   itemsPerPage: 10,
//   totalSuites: 1,
//   totalMotels: 1,
//   radius: 0,
//   maxPages: 1,
//   motels: [
//     tMotelEntity,
//   ],
// );

// final tMotelEntity = MotelEntity(
//   name: 'Test Motel',
//   logo: 'logo.png',
//   neighborhood: 'Test Area',
//   distance: 1.0,
//   favoritesCount: 0,
//   suites: [tSuiteEntity],
//   reviewsCount: 0,
//   rating: 5.0,
// );

// final tSuiteEntity = SuiteEntity(
//   name: 'Test Suite',
//   quantity: 1,
//   showAvailable: true,
//   photos: ['photo.jpg'],
//   items: [
//     ItemEntity(
//       name: 'Test Item',
//     ),
//   ],
//   categories: [
//     ItemCategoryEntity(
//       name: 'Test Category',
//       icon: 'icon.png',
//     ),
//   ],
//   periods: [
//     PeriodEntity(
//       formattedTime: 'Test Period',
//       time: 'Test Time',
//       price: 100.0,
//       totalPrice: 100.0,
//       hasCourtesy: true,
//     ),
//   ],
// );

final tDiscountEntity = DiscountEntity(value: 10.0);

final tPeriodEntity = PeriodEntity(
  formattedTime: '2 horas',
  time: '2',
  price: 100.0,
  totalPrice: 100.0,
  hasCourtesy: false,
  discount: tDiscountEntity,
);

final tPeriodEntityWithoutDiscount = PeriodEntity(
  formattedTime: '2 horas',
  time: '2',
  price: 100.0,
  totalPrice: 100.0,
  hasCourtesy: false,
);

final tItemEntity = ItemEntity(name: 'Test Item');

final tItemCategoryEntity = ItemCategoryEntity(
  name: 'Test Category',
  icon: 'test_icon.png',
);

final tSuiteEntity = SuiteEntity(
  name: 'Test Suite',
  quantity: 1,
  showAvailable: true,
  photos: ['photo1.jpg', 'photo2.jpg'],
  items: [tItemEntity],
  categories: [tItemCategoryEntity],
  periods: [tPeriodEntity, tPeriodEntityWithoutDiscount],
);

final tMotelEntity = MotelEntity(
  name: 'Test Motel',
  logo: 'logo.png',
  neighborhood: 'Test Area',
  distance: 1.0,
  favoritesCount: 10,
  suites: [tSuiteEntity],
  reviewsCount: 100,
  rating: 4.5,
);

final tGoNowData = GoNowDataEntity(
  page: 1,
  itemsPerPage: 10,
  totalSuites: 1,
  totalMotels: 1,
  radius: 5.0,
  maxPages: 1.0,
  motels: [tMotelEntity],
);
