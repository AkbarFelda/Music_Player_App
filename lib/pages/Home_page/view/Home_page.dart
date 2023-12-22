import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/pages/Player_page/controller/Player_controller.dart';
import 'package:music_player/utils/color_resources.dart';
import 'package:music_player/utils/custom_themes.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(
      backgroundColor: ColorResources.bgDarkColor,
      appBar: AppBar(
        backgroundColor: ColorResources.bgDarkColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: ColorResources.white,
            ),
          ),
        ],
        leading: Icon(
          Icons.sort_rounded,
          color: ColorResources.white,
        ),
        title: Text(
          "Harmony",
          style: homePageStyle(
            color: ColorResources.white,
            weight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
        ignoreCase: true,
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL
        ), 
        builder: (BuildContext context, snapshot) {
          if(snapshot.data == null){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No Song Found",
                style: miniTedikapStyle,
                ),
            );
          } else {
            return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(12),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                tileColor: ColorResources.bgColor,
                title: Text(
                  "Music name",
                  style: homePageStyle(
                      color: ColorResources.white,
                      weight: FontWeight.w700,
                      fontSize: 15),
                ),
                subtitle: Text(
                  "Artist name",
                  style: homePageStyle(
                      color: ColorResources.white,
                      weight: FontWeight.w700,
                      fontSize: 12),
                ),
                leading: Icon(
                  Icons.music_note,
                  color: ColorResources.white,
                  size: 32,
                ),
                trailing: const Icon(
                  Icons.play_arrow,
                  color: ColorResources.white,
                  size: 26,
                ),
              ),
            );
          },
        ),
      );
          }
        }
        )
    );
  }
}
