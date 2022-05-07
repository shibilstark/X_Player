import 'package:flutter/material.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:project_video_player/themes/colors.dart';

import '../common/common_functions.dart';

class VideoInfo extends StatelessWidget {
  final VideoData videoData;
  final index;
  final List<String> vidoesList;
  VideoInfo(
      {Key? key,
      required this.index,
      required this.videoData,
      required this.vidoesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoPath = vidoesList[index];
    final videoName = videoPath.split("/").last;

    final fodlerName = videoPath.split("/")[videoPath.split("/").length - 2];

    return Container(
      width: 390,
      height: 600,
      decoration: BoxDecoration(
          color: color_grey, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Properties",
                  style:  TextStyle(color: color_pureWhite, fontSize: 18),
                ),
                SizedBox(
                    height: 40,
                    width: 30,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                          color: color_pureWhite,
                        )))
              ],
            ),
            Divider(
              thickness: 2,
              color: color_smooth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                videoPropertiesTexture(context, "Vdeo Name", videoName),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                    context, "Conatining Folder", "${fodlerName}"),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                  context,
                  "Vdeo Path",
                  videoData.path,
                ),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                  context,
                  "dimension",
                  "${videoData.height}  x  ${videoData.width}",
                ),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                  context,
                  "Duration",
                  "${videoData.duration! ~/ (1000 * 60)} Minutes",
                ),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                  context,
                  "Size ",
                  "${sizeReduce(mb: videoData.filesize! ~/ (1000 * 1000))}",
                ),
                const Gap(
                  H: 5,
                ),
                videoPropertiesTexture(
                  context,
                  "Mimetype",
                  "${videoData.mimetype}",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

videoPropertiesTexture(BuildContext context, String key, var data) {
  return Container(
      child: Row(
    children: [
      Container(
        width: 80,
        child: Text(
          key,
          style: const TextStyle(color: color_pureWhite,fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      Container(
        width: 10,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ":",
              style: TextStyle(fontSize: 15, color: color_dark),
            ),
          ],
        ),
      ),
      Container(
          width: 220,
          child: Text(
            data,
            style: const TextStyle(
                fontSize: 15, color: color_pureWhite, fontStyle: FontStyle.italic),
          )),
    ],
  ));
}
