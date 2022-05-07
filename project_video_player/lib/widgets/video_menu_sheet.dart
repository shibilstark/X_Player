import 'package:flutter/material.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:project_video_player/themes/colors.dart';
import 'package:project_video_player/widgets/video_properties.dart';

class VideoInfoSheet extends StatefulWidget {
  final index;
  final List<String> vidoesList;

  VideoInfoSheet({
    Key? key,
    required this.index,
    required this.vidoesList,
  }) : super(key: key);

  @override
  State<VideoInfoSheet> createState() => _VideoInfoSheetState();
}

class _VideoInfoSheetState extends State<VideoInfoSheet> {
  VideoData? videoData;

  getvideoMetaData() async {
    final videoInfo = FlutterVideoInfo();
    videoData = await videoInfo.getVideoInfo(widget.vidoesList[widget.index]);
  }

  bool foundFav = false;

  bool foundWl = false;

  IconData _favIcon = Icons.favorite_border_outlined;

  Color _favIconColor = color_smooth;

  IconData _wlIcon = Icons.watch_later_outlined;

  Color _WlIconColor = color_smooth;
  int? videoWLIntex;
  int? videoFavIntex;

  // Color _bgOff = secondaryColor;
  @override
  Widget build(BuildContext context) {
    final videoName = widget.vidoesList[widget.index].split("/").last;

    // for (var model in favoritesList.value) {
    //   if (widget.vidoesList[widget.index] == model.path) {
    //     foundFav = true;

    //     setState(() {
    //       _favIcon = Icons.favorite_rounded;
    //       videoFavIntex = favoritesList.value.indexOf(model);
    //       _favIconColor = primaryColor;
    //     });

    //     break;
    //   } else {
    //     foundFav = false;
    //     setState(() {
    //       IconData _favIcon = Icons.favorite_outline;
    //       _favIconColor = secondaryColor;
    //     });
    //   }
    // }

    // for (var model in watchLaterList.value) {
    //   if (widget.vidoesList[widget.index] == model.path) {
    //     foundWl = true;

    //     setState(() {
    //       _wlIcon = Icons.watch_later_rounded;
    //       _WlIconColor = primaryColor;
    //       videoWLIntex = watchLaterList.value.indexOf(model);
    //     });

    //     break;
    //   } else {
    //     foundWl = false;
    //     setState(() {
    //       _WlIconColor = secondaryColor;
    //       IconData _WL_icon = Icons.watch_later_outlined;
    //     });
    //   }
    // }

    getvideoMetaData();
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color_dark,
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: ListView(
          children: [
            Text(
              videoName,
              style: TextStyle(fontSize: 15, color: color_white),
            ),
            Divider(
              thickness: 2,
              color: color_smooth,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                // color:  Colors.amber,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5, color: color_grey),
                              borderRadius: BorderRadius.circular(10)),
                          width: 60,
                          height: 60,
                          child: Center(
                              child: IconButton(
                            onPressed: () {
                              // final favModel = FavoritesModel(
                              //     path: widget.vidoesList[widget.index]);

                              // if (foundFav) {
                              //   deleteVideoFromFavorites(
                              //       favModel, videoFavIntex);
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //           duration: Duration(milliseconds: 700),
                              //           content: Text(
                              //               "Video Removed from Favorites")));
                              // } else {
                              //   addVideoToFavorite(favModel);

                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //           duration: Duration(milliseconds: 700),
                              //           content: Text(
                              //               "Successfully Added to Favorites")));
                              // }

                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              _favIcon,
                              size: 30,
                              color: _favIconColor,
                            ),
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5, color: color_grey),
                              borderRadius: BorderRadius.circular(10)),
                          width: 60,
                          height: 60,
                          child: Center(
                              child: IconButton(
                            onPressed: () {
                              // final WlModel = WatchLaterModel(
                              //     path: widget.vidoesList[widget.index]);

                              // if (foundWl) {
                              //   deleteVideoFromWatchLater(
                              //       WlModel, videoWLIntex);
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //           duration: Duration(milliseconds: 700),
                              //           content: Text(
                              //               "Video Removed from Watchlist")));
                              // } else {
                              //   addVideoToWatchLater(WlModel);

                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //           duration: Duration(milliseconds: 700),
                              //           content: Text(
                              //               "Successfully Added to Watchlist")));
                              // }

                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              _wlIcon,
                              size: 30,
                              color: _WlIconColor,
                            ),
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5, color: color_grey),
                              borderRadius: BorderRadius.circular(10)),
                          width: 60,
                          height: 60,
                          child: Center(
                              child: IconButton(
                            onPressed: () {
                              // Navigator.of(context).pop();
                              // playListShow(
                              //     context, widget.vidoesList[widget.index]);
                            },
                            icon: Icon(
                              Icons.playlist_play_outlined,
                              size: 30,
                              color: color_smooth,
                            ),
                          )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.of(context).pop();

                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    content: VideoInfo(
                                      index: widget.index,
                                      videoData: videoData!,
                                      vidoesList: widget.vidoesList,
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                  ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: color_grey,
                              border: Border.all(width: 0.1, color: color_dark),
                              borderRadius: BorderRadius.circular(5)),
                          width: double.infinity,
                          height: 50,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          // decoration: BoxDecoration(color: secondaryColor),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Properties",
                                  style: TextStyle(
                                      color: color_white, fontSize: 16),
                                ),
                                Icon(
                                  Icons.info_outline,
                                  size: 20,
                                  color: color_white,
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // child: Text("hello"),
    );
  }
}
