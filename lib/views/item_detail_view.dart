import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/item_model.dart';

class ItemDetailView extends StatelessWidget {
  const ItemDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemModel item = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Item ${item.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(item.body ?? '', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
