import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tif_assignment/dimensions.dart';
import 'package:tif_assignment/search_screen.dart';

import 'event_body.dart';
import 'helper/eventlist_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(EventController(eventRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height45,
              ),
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Events",
                    style: TextStyle(fontSize: Dimensions.font26),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(
                              () => SearchScreen(data: controller.eventlist1));
                        },
                        icon: Icon(
                          Icons.search,
                          size: Dimensions.iconSize40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          size: Dimensions.iconSize40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //showing the list body
          const Expanded(child: SingleChildScrollView(child: EventPageBody()))
        ],
      ),
    );
  }
}
