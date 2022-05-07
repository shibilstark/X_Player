import 'package:flutter/material.dart';
import 'package:project_video_player/functions/fetch_videos.dart';
import 'package:project_video_player/themes/colors.dart';

const folderTitleStyyle =  TextStyle(color: color_white, fontSize: 16);

class FolderTile extends StatelessWidget {

  final index;
   FolderTile({Key? key,required this.index}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final folderName = folderList.value[index].split("/").last;
    return Container(
      decoration: BoxDecoration(
        color: color_grey,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      height: 80,
      child: ListTile(
        onLongPress: () {},
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        tileColor: color_grey,
        leading: const Icon(
          Icons.folder_rounded,
          size: 50,
          color:  Color.fromARGB(255, 253, 217, 138),
        ),
        title: Text(
          folderName,
          style: folderTitleStyyle,
        ),
      ),
    );
  }
}
