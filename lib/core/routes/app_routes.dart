import 'package:get/get.dart';
import '../../view/item_list_view.dart';
import '../../view/item_detail_view.dart';

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
