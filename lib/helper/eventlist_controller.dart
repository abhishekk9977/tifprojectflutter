import 'package:get/get.dart';
import 'package:tif_assignment/models/events_model.dart';

import '../api/event_repo.dart';
import 'contentresponse.dart';

class EventController extends GetxController {
  final EventRepo eventRepo;

  EventController({required this.eventRepo});
  List<Datum> eventlist1 = <Datum>[];

  Future<void> getEventList() async {
    Response response = await eventRepo.getEventList();
    print(response.body);
    if (response.statusCode == 200) {
      print("got products");

      final value = ContentModel.fromJson(response.body);

      eventlist1 = value.content!.data!;
      print(eventlist1.length);

      update();
    } else {}
  }
}
