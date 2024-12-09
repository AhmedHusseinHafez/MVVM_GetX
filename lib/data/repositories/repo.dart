import 'package:code_nes_lab_task/data/models/item_model.dart';
import 'package:code_nes_lab_task/core/networking/api_result.dart';
import 'package:code_nes_lab_task/core/networking/network_exceptions.dart';
import 'package:code_nes_lab_task/data/services/web_services.dart';

class Repo {
  final WebServices _webServices;

  Repo(this._webServices);

  Future<ApiResult<List<ItemModel>>> fetchItems(
      {int page = 0, int limit = 10}) async {
    try {
      var response = await _webServices.fetchItems(page: page, limit: limit);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
