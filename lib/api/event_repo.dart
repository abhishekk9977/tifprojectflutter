import 'package:get/get.dart';
import 'package:tif_assignment/api/api_client.dart';

class EventRepo extends GetxService {
  final ApiClient apiClient;
  EventRepo({required this.apiClient});
  Future<Response> getEventList() async {
    return await apiClient.getData("/v1/event");
  }
}
