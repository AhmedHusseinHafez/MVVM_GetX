import 'package:code_nes_lab_task/core/constants/strings_manager.dart';
import 'package:code_nes_lab_task/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/item_model.dart';
import '../view_models/item_controller.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({super.key});

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  final ItemController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringsManager.appBarTitle)),
      body: _body(),
    );
  }

  Widget _body() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Column(
        children: [
          _searchBar(),
          _items(),
        ],
      ),
    );
  }

  Widget _items() {
    return Expanded(
      child: PagedListView<int, ItemModel>(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<ItemModel>(
          itemBuilder: (context, item, index) => ListTile(
            title: Text(item.title ?? ''),
            onTap: () => Get.toNamed(AppRoutes.detail, arguments: item),
          ),
          firstPageProgressIndicatorBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
          newPageProgressIndicatorBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
          noItemsFoundIndicatorBuilder: (_) =>
              const Center(child: Text(StringsManager.noDataToDisplay)),
          firstPageErrorIndicatorBuilder: (_) => Center(
            child: Text(controller.pagingController.error.toString()),
          ),
          noMoreItemsIndicatorBuilder: (_) => const Center(
            child: Text(StringsManager.noMoreItems),
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: StringsManager.searchHint,
          border: OutlineInputBorder(),
        ),
        onChanged: controller.searchWithTitle,
      ),
    );
  }

  /// Method to handle refresh action
  Future<void> _onRefresh() async {
    controller.pagingController.refresh();
    controller.searchWithTitle('');
  }
}
