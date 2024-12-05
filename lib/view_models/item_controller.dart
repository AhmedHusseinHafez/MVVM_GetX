import 'dart:developer';

import 'package:code_nes_lab_task/core/services/repo.dart';
import 'package:get/get.dart';
import '../models/item_model.dart';

class ItemController extends GetxController {
  final Repo _repo = Get.put(Repo(Get.find()));

  var items = <ItemModel>[].obs;
  var isLoading = false.obs;
  var isFetchingMore = false.obs;

  var filteredItems = <ItemModel>[].obs;

  var errorMessage = ''.obs;

  int _start = 0;
  final int _limit = 10;
  bool _hasMore = true;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() async {
    var result = await _repo.fetchItems();
    result.when(
      success: (success) {
        log("${success.length}");
      },
      failure: (error) {
        log("${error.message}");
        log("${error.content}");
        log("${error.responseCode}");
      },
    );
    // if (isLoading.value || !_hasMore) return;

    // isLoading(true);
    // try {
    //   final data = await _apiService.fetchItems(start: _start, limit: _limit);
    //   if (data.isEmpty) {
    //     _hasMore = false;
    //   } else {
    //     final newItems = data.map((e) => ItemModel.fromJson(e)).toList();
    //     items.addAll(newItems);
    //     filteredItems.value = items;
    //     _start += _limit;
    //   }
    // } catch (e) {
    //   errorMessage.value = e.toString();
    // } finally {
    //   isLoading(false);
    // }
  }

  void loadMoreItems() async {
    // if (isFetchingMore.value || !_hasMore) return;

    // isFetchingMore(true);
    // try {
    //   final data = await _apiService.fetchItems(start: _start, limit: _limit);
    //   if (data.isEmpty) {
    //     _hasMore = false;
    //   } else {
    //     final newItems = data.map((e) => ItemModel.fromJson(e)).toList();
    //     items.addAll(newItems);
    //     filteredItems.value = items;
    //     _start += _limit;
    //   }
    // } catch (e) {
    //   errorMessage.value = e.toString();
    // } finally {
    //   isFetchingMore(false);
    // }
  }

  void filterItems(String query) {
    // if (query.isEmpty) {
    //   filteredItems.value = items;
    // } else {
    //   filteredItems.value = items
    //       .where(
    //           (item) => item.title.toLowerCase().contains(query.toLowerCase()))
    //       .toList();
    // }
  }
}
