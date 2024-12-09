import 'package:code_nes_lab_task/core/constants/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/models/item_model.dart';

class ItemDetailView extends StatelessWidget {
  const ItemDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemModel item = Get.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManger.primary,
        appBar: _appBar(item),
        body: _body(item),
      ),
    );
  }

  Widget _body(ItemModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorManger.secondary,
            ),
          ),
          const SizedBox(height: 16),
          Text(item.body ?? '',
              style: const TextStyle(
                fontSize: 19,
                color: ColorManger.white,
              )),
        ],
      ),
    );
  }

  AppBar _appBar(ItemModel item) {
    return AppBar(
      backgroundColor: ColorManger.primary,
      title: Text(
        'Item ${item.id}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
