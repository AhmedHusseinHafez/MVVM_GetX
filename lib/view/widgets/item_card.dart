import 'package:code_nes_lab_task/core/constants/color_manger.dart';
import 'package:code_nes_lab_task/core/routes/app_routes.dart';
import 'package:code_nes_lab_task/model/models/item_model.dart';
import 'package:code_nes_lab_task/viewmodel/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.screenWidth,
    required this.index,
    required this.item,
    required this.controller,
  });

  final double screenWidth;
  final int index;
  final ItemModel item;
  final ItemController controller;

  @override
  Widget build(BuildContext context) {
    double marixXaxis = controller.startAnimation.value ? 0 : screenWidth;
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: ColorManger.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 100)),
      transform: Matrix4.translationValues(marixXaxis, 0, 0),
      child: _listTile(),
    );
  }

  Widget _listTile() {
    return ListTile(
      title: Text(
        item.title ?? '',
        style: const TextStyle(
          color: ColorManger.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () => Get.toNamed(AppRoutes.detail, arguments: item),
    );
  }
}
