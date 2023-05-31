import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:s_bin/gen/colors.gen.dart';
import 'package:s_bin/src/common/app_tags.dart';
import 'package:s_bin/src/common/prefernce_utils.dart';
import 'package:s_bin/src/common/widgets/app_background.dart';
import 'package:s_bin/src/common/widgets/common_app_bar.dart';
import 'package:s_bin/src/common/widgets/round_button.dart';
import 'package:s_bin/src/modules/marker_detail/controllers/marker_detail_controller.dart';
import 'package:s_bin/src/routes/app_routes.dart';



class MarkerDetailScreen extends GetView<MarkerDetailController> {
  MarkerDetailScreen({super.key});
  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.getBinStatus(arguments['marker']);
    debugPrint("arguments : $arguments");
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CommonAppBar(
            title: 'Device Detail',
            leadingWidget: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorName.black,
                )),
          )),
      body: AppBackground(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 10,
              child: SizedBox(
                width: 100,
                child: RoundButton(
                  onClick: () {
                    PreferenceUtils.clearData();
                    Get.offAllNamed(AppRoutes.login);
                  },
                  text: "Log out",
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/throwing_trash.png',
                      height: 240,
                      width: 240,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 50, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Device Name : ${arguments['device']}",
                          style: AppTags.font20weight500black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,bottom: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Location : ${arguments['location']}",
                            style: AppTags.font20weight500black,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,bottom: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(controller.foodWaste.value,
                            style: AppTags.font20weight500black,
                          )
                      ),
                    ),

                  ],
                )),

            Positioned(
              bottom: 20,
              left: 20,
              right: 20,

              child: RoundButton(onClick: (){
                MapsLauncher.launchCoordinates(arguments['Latitude'], arguments['Longitude']);
              }, text: 'Navigate'),
            )
          ],
        ),
      ),
    );
  }
}
