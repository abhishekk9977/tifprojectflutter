import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:tif_assignment/dimensions.dart';
import 'package:tif_assignment/helper/contentresponse.dart';
import 'package:tif_assignment/widgets/bigtext.dart';
import 'package:tif_assignment/widgets/expandablewidget.dart';
import 'package:tif_assignment/widgets/smalltext.dart';

class EventDetail extends StatefulWidget {
  final Datum data;
  const EventDetail({super.key, required this.data});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(Dimensions.width20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: Dimensions.height20),
                height: 280,
                decoration: BoxDecoration(),
                child: Image.network(this.widget.data.bannerImage.toString()),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.height45, left: Dimensions.width30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: Dimensions.iconSize40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: Dimensions.width15,
                      ),
                      BigText(
                          text: "Event Details",
                          size: Dimensions.font24,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      Padding(
                        padding: EdgeInsets.only(right: Dimensions.width30),
                        child: Container(
                          width: Dimensions.height45,
                          height: Dimensions.height48,
                          child: Icon(
                            Icons.bookmark_outlined,
                            size: Dimensions.iconSize28,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius12),
                              color: Color.fromARGB(255, 205, 203, 203)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            // decoration: BoxDecoration(border: Border.all()),
            height: Dimensions.height120,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.width10),
              child: BigText(
                text: this.widget.data.title.toString(),
                fontWeight: FontWeight.w400,
                size: Dimensions.font30,
                overFlow: TextOverflow.visible,
              ),
            ),
          ),

          //Event Details Section

          Container(
            height: Dimensions.height65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white),
            margin: EdgeInsets.only(
              left: Dimensions.width10,
            ),
            child: Row(
              children: [
                //image section
                Container(
                  height: Dimensions.height52,
                  width: Dimensions.height55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    image: DecorationImage(
                      opacity: 0.7,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/tif_logo.jpg",
                      ),
                    ),
                  ),
                ),

                //Text section
                Expanded(
                  child: Container(
                    height: Dimensions.height85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        bottomRight: Radius.circular(Dimensions.radius20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width20, top: Dimensions.width10
                          //top: Dimensions.height20,
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BigText(
                              text: this.widget.data.organiserName.toString(),
                              size: Dimensions.font15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          BigText(
                            text: "Organizer",
                            //overFlow: TextOverflow.visible,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            size: Dimensions.font13,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          // Event Date  and Time Section

          Container(
            //width: 1000,
            height: Dimensions.height65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white),
            margin: EdgeInsets.only(
              left: Dimensions.width10,
            ),
            child: Row(
              children: [
                //image section
                Container(
                  height: Dimensions.height52,
                  width: Dimensions.height55,
                  child: Icon(
                    Icons.calendar_month_rounded,
                    size: Dimensions.iconSize28,
                    color: Colors.blue,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(234, 205, 231, 244),
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                ),

                //Text section
                Expanded(
                  child: Container(
                    height: Dimensions.height85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        bottomRight: Radius.circular(Dimensions.radius20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width20, top: Dimensions.width10
                          //top: Dimensions.height20,
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BigText(
                              //   text: "14 December, 2021",
                              text:
                                  "${DateFormat('d, MMMM, y').format(DateTime.parse(this.widget.data.dateTime.toString()))}",
                              size: Dimensions.font15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          BigText(
                            // text: "Tuesday, 4:00PM - 9:00PM ",
                            text:
                                "${DateFormat('EEEE, hh:mm a').format(DateTime.parse(this.widget.data.dateTime.toString()))}",
                            //overFlow: TextOverflow.visible,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            size: Dimensions.font13,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          //Event location section

          Container(
            //width: 1000,
            height: Dimensions.height65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white),
            margin: EdgeInsets.only(
              left: Dimensions.width10,
            ),
            child: Row(
              children: [
                //image section
                Container(
                  height: Dimensions.height52,
                  width: Dimensions.height55,
                  child: Icon(
                    Icons.location_on_rounded,
                    size: Dimensions.iconSize28,
                    color: Colors.blue,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(234, 205, 231, 244),
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                ),

                //Text section
                Expanded(
                  child: Container(
                    height: Dimensions.height85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        bottomRight: Radius.circular(Dimensions.radius20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width20, top: Dimensions.width10
                          //top: Dimensions.height20,
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BigText(
                              text: "Gala Convention Centre",
                              size: Dimensions.font15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          BigText(
                            text: "36 Guild Street London, UK ",
                            //overFlow: TextOverflow.visible,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            size: Dimensions.font13,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

// Booking options side

          Container(
            // decoration: BoxDecoration(border: Border.all()),
            height: Dimensions.height20,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.width10),
              child: BigText(
                text: "About Event",
                fontWeight: FontWeight.w500,
                size: Dimensions.font18,
                overFlow: TextOverflow.visible,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.height10),
                height: 380,
                child: ExpandableTextWidget(
                  text:
                      "A virus is a submicroscopic infectious ageeajd kdksdoe mdkmck ",
                ),
              ),
              Positioned(
                top: 150,
                left: Dimensions.height10,
                width: Dimensions.screenWidth,
                height: 250,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: 150,
                  height: 150,
                ),
              ),
              Positioned(
                top: 250,
                left: 100,
                right: 100,
                //width: Dimensions.screenWidth,
                height: 100,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(Dimensions.height30),
                          child: BigText(
                            text: "BOOK NOW",
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            size: Dimensions.iconSize16,
                          ),
                        ),
                        Container(
                          width: Dimensions.height45,
                          height: Dimensions.height48,
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: Dimensions.iconSize28,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: Color.fromARGB(255, 45, 123, 225),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
