import 'package:code_nes_lab_task/model/repositories/repo.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';
import '../model/models/item_model.dart';

class ItemController extends GetxController {
  final Repo repo;

  ItemController({required this.repo});

  var startAnimation = false.obs;

  var searchQuery = ''.obs;

  static const int _pageSize = 10;

  final PagingController<int, ItemModel> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() async {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) => _fetchItems(pageKey));
  }

  Future<void> _fetchItems(int pageKey) async {
    final result = await repo.fetchItems(page: pageKey, limit: _pageSize);

    result.when(
      success: (data) {
        // Search with title or body
        final filteredData = _filterItems(data, searchQuery.value);

        // Determine if it's the last page based on the number of items fetched
        final isLastPage = filteredData.length < _pageSize;

        if (isLastPage) {
          // Append the last page of data
          pagingController.appendLastPage(filteredData);
        } else {
          // Calculate the next page key as the current page + 1
          final nextPageKey = pageKey + 1;

          // Append the current page of data and set the next page key
          pagingController.appendPage(filteredData, nextPageKey);
        }

        // Start animation on the next frame
        WidgetsBinding.instance.addPostFrameCallback((_) {
          startAnimation.value = true;
        });
      },
      failure: (error) {
        pagingController.error = error.message ?? 'Unknown Error';
      },
    );
  }

  // Search filter logic moved to a separate function for clarity
  List<ItemModel> _filterItems(List<ItemModel> items, String query) {
    if (query.isEmpty) return items;
    return items.where((item) {
      // final bodyMatches = item.body?.contains(query) ?? false; // add this line if you need to search by body
      final titleMatches = item.title?.contains(query) ?? false;
      return titleMatches;
    }).toList();
  }

  // Update search query and refresh the items list
  void searchWithTitle(String query) {
    searchQuery.value = query;
    pagingController.refresh();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
