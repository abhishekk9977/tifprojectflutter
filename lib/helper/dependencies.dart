import 'package:get/get.dart';
import 'package:tif_assignment/api/api_client.dart';
import 'package:tif_assignment/api/event_repo.dart';
import 'package:tif_assignment/helper/eventlist_controller.dart';

Future<void> init() async {
  //api client

  Get.lazyPut(() => ApiClient(
      appBaseUrl: "https://sde-007.api.assignment.theinternetfolks.works"));

  //repos
  Get.lazyPut(() => EventRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => EventController(eventRepo: Get.find()));
}
