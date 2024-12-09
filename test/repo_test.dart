import 'package:code_nes_lab_task/data/repositories/repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:code_nes_lab_task/data/models/item_model.dart';
import 'package:code_nes_lab_task/core/networking/api_result.dart';
import 'package:dio/dio.dart';

import 'mocks/web_services_mock.mocks.dart';

void main() {
  late Repo repo;
  late MockWebServices mockWebServices;

  setUp(() {
    mockWebServices = MockWebServices();
    repo = Repo(mockWebServices);
  });

  group('Repo tests', () {
    test('fetchItems returns success result', () async {
      // Arrange
      final items = [
        ItemModel(id: 1, title: 'Title 1', body: 'Body 1'),
        ItemModel(id: 2, title: 'Title 2', body: 'Body 2'),
      ];

      when(mockWebServices.fetchItems(page: 0, limit: 10))
          .thenAnswer((_) async => items);

      // Act
      final result = await repo.fetchItems(page: 0, limit: 10);

      // Assert
      expect(result, isA<Success<List<ItemModel>>>());
      expect((result as Success<List<ItemModel>>).data, items);
    });

    test('fetchItems returns failure result when there is an error', () async {
      // Arrange
      when(mockWebServices.fetchItems(page: 0, limit: 10))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act
      final result = await repo.fetchItems(page: 0, limit: 10);

      // Assert
      expect(result, isA<Failure<List<ItemModel>>>());
    });
  });
}
