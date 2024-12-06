import 'package:get/get.dart';
import '../../views/item_list_view.dart';
import '../../views/item_detail_view.dart';

class AppRoutes {
  static const String list = '/';
  static const String detail = '/detail';

  static final routes = [
    GetPage(name: list, page: () => const ItemListView()),
    GetPage(
      transition: Transition.zoom,
      name: detail,
      page: () => const ItemDetailView(),
    ),
  ];
}
