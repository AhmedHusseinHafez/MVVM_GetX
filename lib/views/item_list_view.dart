import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_models/item_controller.dart';

class ItemListView extends StatelessWidget {
  final ItemController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body: Obx(() {
        if (controller.isLoading.value && controller.items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search items...',
                  border: OutlineInputBorder(),
                ),
                onChanged: controller.filterItems,
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.items.clear();
                  controller.fetchItems();
                },
                child: ListView.builder(
                  itemCount: controller.filteredItems.length + 1,
                  itemBuilder: (context, index) {
                    if (index < controller.filteredItems.length) {
                      final item = controller.filteredItems[index];
                      return ListTile(
                        title: Text(item.title ?? ''),
                        onTap: () => Get.toNamed('/detail', arguments: item),
                      );
                    } else {
                      if (controller.isFetchingMore.value) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (!controller.isFetchingMore.value &&
                          controller.items.isNotEmpty) {
                        controller.loadMoreItems();
                        return const SizedBox();
                      }
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
