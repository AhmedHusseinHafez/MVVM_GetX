import 'package:code_nes_lab_task/core/constants/color_manger.dart';
import 'package:code_nes_lab_task/core/constants/strings_manager.dart';
import 'package:code_nes_lab_task/core/routes/app_routes.dart';
import 'package:code_nes_lab_task/models/item_model.dart';
import 'package:code_nes_lab_task/view_models/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ItemsBuilder extends StatefulWidget {
  const ItemsBuilder({
    super.key,
    required this.controller,
  });

  final ItemController controller;

  @override
  State<ItemsBuilder> createState() => _ItemsBuilderState();
}

class _ItemsBuilderState extends State<ItemsBuilder> {
  double screenWidth = 0;

  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return PagedListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      pagingController: widget.controller.pagingController,
      builderDelegate: PagedChildBuilderDelegate<ItemModel>(
        itemBuilder: (context, item, index) => _itemCard(item, index),
        firstPageProgressIndicatorBuilder: (_) => _loading(),
        newPageProgressIndicatorBuilder: (_) => _loading(),
        noItemsFoundIndicatorBuilder: (_) =>
            Center(child: _text(StringsManager.noDataToDisplay)),
        firstPageErrorIndicatorBuilder: (_) => Center(
          child: _text(StringsManager.noDataToDisplay),
        ),
        noMoreItemsIndicatorBuilder: (_) => Center(
          child: _text(StringsManager.noMoreItems),
        ),
      ),
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, color: ColorManger.white),
    );
  }

  Widget _itemCard(ItemModel item, int index) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: ColorManger.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 100)),
      transform: Matrix4.translationValues(
          widget.controller.startAnimation.value ? 0 : screenWidth, 0, 0),
      child: ListTile(
        title: Hero(
          tag: item.id ?? 'default_tag', // Use unique tag
          child: Text(
            item.title ?? '',
            style: const TextStyle(
              color: ColorManger.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        onTap: () => Get.toNamed(AppRoutes.detail, arguments: item),
      ),
    );
  }

  Widget _loading() => const Center(
          child: CircularProgressIndicator.adaptive(
        backgroundColor: ColorManger.white,
        valueColor: AlwaysStoppedAnimation<Color>(ColorManger.secondary),
      ));
}
