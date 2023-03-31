import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tif_assignment/eventDetail.dart';
import 'package:tif_assignment/helper/eventlist_controller.dart';
import 'package:tif_assignment/widgets/bigtext.dart';
import 'package:tif_assignment/widgets/smalltext.dart';
import 'package:intl/intl.dart';
import 'dimensions.dart';

class EventPageBody extends StatefulWidget {
  const EventPageBody({super.key});

  @override
  State<EventPageBody> createState() => _EventPageBodyState();
}

class _EventPageBodyState extends State<EventPageBody> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(builder: (eventdata) {
      return eventdata.eventlist1.isEmpty == true
          ? Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              child: Center(child: CircularProgressIndicator()),
            )
          : ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: eventdata.eventlist1.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                        () => EventDetail(data: eventdata.eventlist1[index]));
                  },
                  child: Container(
                    //width: 1000,

                    height: Dimensions.height160,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        //image section
                        Container(
                          height: Dimensions.height120,
                          width: Dimensions.height100,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                          ),
                          child: Image.network(eventdata
                              .eventlist1[index].bannerImage
                              .toString()),
                        ),

                        //Text section
                        Expanded(
                          child: Container(
                            height: 115,
                            decoration: BoxDecoration(
                              //color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Dimensions.width20,
                                top: Dimensions.height10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SmallText(
                                    text:
                                        "${DateFormat('E,dd  MMM, hh:mm a').format(DateTime.parse(eventdata.eventlist1[index].dateTime.toString()))}",
                                    size: Dimensions.font14,
                                    color: Color.fromARGB(255, 45, 123, 225),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  BigText(
                                    text: eventdata.eventlist1[index].title
                                        .toString(),
                                    overFlow: TextOverflow.visible,
                                    size: Dimensions.font18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 56),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10,
                                        ),
                                        SmallText(
                                          text: eventdata
                                                  .eventlist1[index].venueCity
                                                  .toString() +
                                              ', ' +
                                              eventdata.eventlist1[index]
                                                  .venueCountry
                                                  .toString(),
                                          size: Dimensions.font14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    });
  }
}
