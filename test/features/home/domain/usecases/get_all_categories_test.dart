import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetAllCategoriesUserCase usecase;
  late MockCategoryRepository mockCategoryRepository;

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    usecase = GetAllCategoriesUserCase(mockCategoryRepository);
  });

  const categories = [
    CategoryEntity(
      id: '12324fdf',
      name: "Category 1",
      image: '',
    ),
    CategoryEntity(
      id: '12324fdf',
      name: "Category 2",
      image: '',
    ),
    CategoryEntity(
      id: '12324fdf',
      name: "Category 3",
      image: '',
    ),
  ];

  test('should get all the categories', () async {
// arrange
    when(mockCategoryRepository.getCategories())
        .thenAnswer((_) async => const Right(categories));
    // act

    final result = await usecase.call();

// assert

    expect(result, const Right(categories));
  });
}
