import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tif_assignment/dimensions.dart';
import 'package:tif_assignment/widgets/smalltext.dart';

import 'helper/contentresponse.dart';
import 'widgets/bigtext.dart';

class SearchScreen extends StatefulWidget {
  final List<Datum> data;
  const SearchScreen({super.key, required this.data});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    print(this.widget.data.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: Dimensions.height30, left: Dimensions.height20),
        child:
            //use listview.builder
            //return this column
            Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: Dimensions.iconSize40,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width15,
                ),
                BigText(
                    text: "Search",
                    size: Dimensions.font24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ],
            ),
            TextFormField(
              style: TextStyle(fontSize: Dimensions.font24),
              decoration: InputDecoration(
                border: InputBorder.none,

                icon: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.search_rounded,
                    size: Dimensions.iconSize30,
                    color: Colors.blue,
                  ),
                ),
                // hintText: 'What do people call you?',
                labelText: 'Type Event Name',
              ),
            ),

            //List for searchingcmd

            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: this.widget.data.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                            child: Image.network(
                                this.widget.data[index].bannerImage.toString()),
                          ),

                          //Text section
                          Expanded(
                            child: Container(
                              height: 115,
                              decoration: BoxDecoration(
                                //color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.radius20),
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
                                          "${DateFormat('E,dd  MMM, hh:mm a').format(DateTime.parse(this.widget.data[index].dateTime.toString()))}",
                                      size: Dimensions.font14,
                                      color: Color.fromARGB(255, 45, 123, 225),
                                    ),
                                    BigText(
                                      text: this
                                          .widget
                                          .data[index]
                                          .title
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
                                            text: this
                                                    .widget
                                                    .data[index]
                                                    .venueCity
                                                    .toString() +
                                                ', ' +
                                                this
                                                    .widget
                                                    .data[index]
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
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
