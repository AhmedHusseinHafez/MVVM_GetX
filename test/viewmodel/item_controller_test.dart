import 'package:code_nes_lab_task/core/networking/api_result.dart';
import 'package:code_nes_lab_task/core/networking/error_model.dart';
import 'package:code_nes_lab_task/model/models/item_model.dart';
import 'package:code_nes_lab_task/model/repositories/repo.dart';
import 'package:code_nes_lab_task/viewmodel/item_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'item_controller_test.mocks.dart';

@GenerateMocks([Repo])
void main() {
  late MockRepo mockRepo;
  late ItemController controller;

  setUp(() {
    mockRepo = MockRepo();
    controller = ItemController(repo: mockRepo);
  });

  group('ItemController tests', () {
    test('should fetch and append items successfully', () async {
      // Arrange
      final mockItems = List.generate(10, (index) {
        return ItemModel(id: index, title: 'Title $index', body: 'Body $index');
      });

      when(mockRepo.fetchItems(page: 1, limit: 10))
          .thenAnswer((_) async => ApiResult.success(mockItems));

      // Act
      await controller.fetchItems(1);

      // Assert
      expect(controller.pagingController.itemList, mockItems);
    });

    test('should handle API failure', () async {
      // Arrange
      final error = ErrorModel(message: "API Error");
      when(mockRepo.fetchItems(page: 1, limit: 10))
          .thenAnswer((_) async => ApiResult.failure(error));

      // Act
      await controller.fetchItems(1);

      // Assert
      expect(controller.pagingController.error, error.message);
    });

    test('should filter items based on search query', () async {
      // Arrange
      final mockItems = [
        ItemModel(id: 0, title: 'Flutter Rocks', body: 'Details...'),
        ItemModel(id: 1, title: 'GetX State Management', body: 'Details...')
      ];
      when(mockRepo.fetchItems(page: 1, limit: 10))
          .thenAnswer((_) async => ApiResult.success(mockItems));

      // Act
      controller.searchWithTitle('Flutter');
      await controller.fetchItems(1);

      // Assert
      expect(controller.pagingController.itemList, [mockItems[0]]);
    });

    test('should refresh paging controller on query change', () async {
      // Arrange
      final mockItems = [
        ItemModel(id: 1, title: 'Test', body: 'Details...'),
        ItemModel(id: 2, title: 'More Test', body: 'Details...')
      ];
      when(mockRepo.fetchItems(page: 1, limit: 10))
          .thenAnswer((_) async => ApiResult.success(mockItems));

      // Act
      controller.searchWithTitle('New Query');

      // Assert
      expect(controller.searchQuery.value, 'New Query');
    });
  });
}
