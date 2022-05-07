import 'package:flutter/material.dart';
import '../common/common_functions.dart';
import '../functions/fetch_videos.dart';
import '../widgets/folder_tile.dart';

class FolderView extends StatelessWidget {
  const FolderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    createFolderView();

    double _w = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
      builder: (BuildContext context, List<String> folderList, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView.separated(
            separatorBuilder: (context, index) => Gap(
              H: 10,
            ),
            // padding: EdgeInsets.all(_w / 30),
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: folderList.length,
            itemBuilder: (BuildContext context, int index) {
              return FolderTile(index: index,);
            },
          ),
        );
      },
      valueListenable: folderList,
    );
  }
}
