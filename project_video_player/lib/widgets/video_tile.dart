import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_video_player/functions/fetch_videos.dart';
import 'package:project_video_player/themes/colors.dart';
import 'package:project_video_player/widgets/video_menu_sheet.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

const folderTitleStyyle = TextStyle(color: color_white, fontSize: 16);

class VideoTile extends StatefulWidget {
  const VideoTile({Key? key, required this.index}) : super(key: key);
  final index;

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  var thumbnail;

  thumbGenerate() async {
    thumbnail = await VideoThumbnail.thumbnailFile(
      video: allVideos.value[widget.index],
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      maxHeight:
          64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      // quality: 100
    );

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    thumbGenerate();
  }

  @override
  Widget build(BuildContext context) {
    final videoName = allVideos.value[widget.index].split("/").last;
    return Container(
      decoration: BoxDecoration(
        color: color_grey,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      height: 80,
      child: ListTile(
        onLongPress: () {
          showModalBottomSheet(
                  elevation: 5,

                  // isDismissible: true,
                  context: context,
                  builder: (context) => VideoInfoSheet(
                        index: widget.index,
                        vidoesList: allVideos.value,
                      ));

        },
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        tileColor: color_grey,
        leading: Container(
          height: 60,
          width: 80,
          child: thumbnail == null
              ? Lottie.asset("assets/lottie/lf30_editor_spt5sngz.json")
              : Image.file(File(thumbnail)),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.more_vert_rounded,
            color: color_white,
          ),
          onPressed: () {
            showModalBottomSheet(
                  elevation: 5,

                  // isDismissible: true,
                  context: context,
                  builder: (context) => VideoInfoSheet(
                        index: widget.index,
                        vidoesList: allVideos.value,
                      ));
          },
        ),
        title: Text(
          videoName,
          style: folderTitleStyyle,
        ),
      ),
    );
  }
}
