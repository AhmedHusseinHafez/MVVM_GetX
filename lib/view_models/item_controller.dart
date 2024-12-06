import 'package:code_nes_lab_task/core/services/repo.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';
import '../models/item_model.dart';

class ItemController extends GetxController {
  final Repo _repo = Get.put(Repo(Get.find()));

  bool startAnimation = false;

  var searchQuery = ''.obs;

  static const int _pageSize = 10;

  final PagingController<int, ItemModel> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() async {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchItems(pageKey).then((_) => WidgetsBinding.instance
          .addPostFrameCallback((_) => startAnimation = true));
    });
  }

  Future<void> fetchItems(int pageKey) async {
    final result = await _repo.fetchItems(page: pageKey, limit: _pageSize);

    result.when(
      success: (data) {
        final filteredData = searchQuery.isNotEmpty
            ? data
                .where(
                    (item) => item.title?.contains(searchQuery.value) ?? false)
                .toList()
            : data;

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
      },
      failure: (error) {
        pagingController.error = error.message ?? 'Unknown Error';
      },
    );
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
