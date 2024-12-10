import 'package:code_nes_lab_task/core/constants/color_manger.dart';
import 'package:code_nes_lab_task/core/constants/strings_manager.dart';
import 'package:code_nes_lab_task/model/models/item_model.dart';
import 'package:code_nes_lab_task/view/widgets/item_card.dart';
import 'package:code_nes_lab_task/viewmodel/item_controller.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return PagedListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      pagingController: widget.controller.pagingController,
      builderDelegate: PagedChildBuilderDelegate<ItemModel>(
        itemBuilder: (context, item, index) => _itemBuilder(item, index),
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

  Widget _itemBuilder(ItemModel item, int index) {
    return ItemCard(
      screenWidth: screenWidth,
      index: index,
      item: item,
      controller: widget.controller,
    );
  }

  Widget _loading() => const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: ColorManger.white,
          valueColor: AlwaysStoppedAnimation<Color>(ColorManger.secondary),
        ),
      );
}
