import 'package:code_nes_lab_task/core/constants/app_constants.dart';
import 'package:code_nes_lab_task/model/models/item_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("/posts")
  Future<List<ItemModel>> fetchItems({
    @Query("_page") required int page,
    @Query("_limit") required int limit,
  });
}
