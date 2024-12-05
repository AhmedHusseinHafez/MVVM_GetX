import 'package:code_nes_lab_task/models/item_model.dart';
import 'package:code_nes_lab_task/core/networking/api_result.dart';
import 'package:code_nes_lab_task/core/networking/network_exceptions.dart';
import 'package:code_nes_lab_task/core/services/web_services.dart';

class Repo {
  final WebServices _webServices;

  Repo(this._webServices);

  Future<ApiResult<List<ItemModel>>> fetchItems(
      {int start = 0, int limit = 10}) async {
    try {
      var response = await _webServices.fetchItems(start: start, limit: limit);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
