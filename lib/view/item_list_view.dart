import 'package:code_nes_lab_task/core/constants/color_manger.dart';
import 'package:code_nes_lab_task/core/constants/strings_manager.dart';
import 'package:code_nes_lab_task/view/widgets/item_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/item_controller.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({super.key});

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  final ItemController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManger.primary,
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: ColorManger.primary,
      centerTitle: true,
      title: const Text(
        StringsManager.appBarTitle,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _body() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _searchBar(),
            const SizedBox(height: 20),
            _items(),
          ],
        ),
      ),
    );
  }

  Widget _items() {
    return Expanded(
      child: ItemsBuilder(controller: controller),
    );
  }

  Widget _searchBar() {
    return SearchBar(
      hintText: StringsManager.searchHint,
      hintStyle:
          const WidgetStatePropertyAll(TextStyle(color: ColorManger.white)),
      backgroundColor: const WidgetStatePropertyAll(ColorManger.secondary),
      onChanged: controller.searchWithTitle,
    );
  }

  /// Method to handle refresh action
  Future<void> _onRefresh() async {
    controller.pagingController.refresh();
    controller.searchWithTitle('');
  }
}
