import 'package:flutter/material.dart';
import 'package:project_video_player/screens/folder_view.dart';
import 'package:project_video_player/screens/video_view.dart';
import 'package:project_video_player/test_screen.dart';
import 'package:project_video_player/themes/colors.dart';

final titleStyle = tStyle(
  color: Colors.white,
  fSize: 22,
);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalKey = GlobalKey<ScaffoldState>();

  int tabIndex = 0;

  int curretnIndex = 0;

  final screens = [
    null,
    const TestScreen(),
    const TestScreen(),
    const TestScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: color_dark,
          key: globalKey,
          bottomNavigationBar: myNavigationBar(context),
          appBar: homeAppBar(context: context),
          // drawer: const SimpleDrawer(),
          body: curretnIndex != 0
              ? screens[curretnIndex]
              : const TabBarView(children: [FolderView(), VideoView()]),
          // floatingActionButton: curretnIndex == 0 && lastPlayedvideo.isNotEmpty
          //     ? Container(
          //         width: 60,
          //         child: FloatingActionButton(
          //           child: Icon(
          //             Icons.play_arrow,
          //             color: Colors.white,
          //             size: 30,
          //           ),
          //           onPressed: () async {
          //             Navigator.of(context).push(MaterialPageRoute(
          //                 builder: (context) => LocalVideoPlayer(
          //                     videoUrl: lastPlayedvideo.last.path)));
          //           },
          //           backgroundColor: lightColor,
          //         ),
          //       )
          //     : null,
        ),
      ),
    );
  }

  final screenNames = [
    "X Player",
    "Favorites",
    "Watch Later",
    "PlayLists",
  ];

  homeAppBar({required BuildContext context}) {
    // final obj = PlayListStateFulWidgetState();
    return PreferredSize(
      child: AppBar(
          // leading: IconButton(
          //   icon: const Icon(
          //     Icons.menu,
          //     color: Colors.white,
          //     size: 30,
          //   ),
          //   onPressed: () {
          //     globalKey.currentState!.openDrawer();
          //   },
          // ),
          iconTheme: IconThemeData(color: color_dark),
          backgroundColor: color_grey,
          // titleSpacing: -5,
          title: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              screenNames[curretnIndex],
              style: titleStyle,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: curretnIndex == 0
                  ? IconButton(
                      onPressed: () {
                        // showSearch(context: context, delegate: Mysearch());
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 27,
                      ))
                  : curretnIndex == 1
                      ? IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      contentPadding: const EdgeInsets.all(10),
                                      title: Text(
                                        "Are you sure?",
                                        style: TextStyle(
                                            color: color_dark, fontSize: 18),
                                        textAlign: TextAlign.start,
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: color_dark),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              "Clear",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: color_dark),
                                            )),
                                      ],
                                    ));
                          },
                          icon: const Icon(
                            Icons.clear_all_rounded,
                            color: Colors.white,
                            size: 27,
                          ))
                      : curretnIndex == 2
                          ? IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (Context) => AlertDialog(
                                          contentPadding:
                                              const EdgeInsets.all(10),
                                          title: Text(
                                            "Are you sure?",
                                            style: TextStyle(
                                                color: color_dark,
                                                fontSize: 18),
                                            textAlign: TextAlign.start,
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: color_dark),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "Clear",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: color_dark),
                                                )),
                                          ],
                                        ));
                              },
                              icon: const Icon(
                                Icons.clear_all_rounded,
                                color: Colors.white,
                                size: 27,
                              ))
                          : curretnIndex == 3
                              ? Row(
                                  children: [
                                    // playLists.value.isNotEmpty
                                    //     ? TextButton(
                                    //         onPressed: () {
                                    //           showDialog(
                                    //               context: context,
                                    //               builder: (Context) =>
                                    //                   AlertDialog(
                                    //                     contentPadding:
                                    //                         EdgeInsets.all(10),
                                    //                     title: const Text(
                                    //                       "Are you sure?",
                                    //                       style: TextStyle(
                                    //                           color:
                                    //                               primaryColor,
                                    //                           fontSize: 18),
                                    //                       textAlign:
                                    //                           TextAlign.start,
                                    //                     ),
                                    //                     actions: [
                                    //                       TextButton(
                                    //                           onPressed: () {
                                    //                             Navigator.of(
                                    //                                     context)
                                    //                                 .pop();
                                    //                           },
                                    //                           child: const Text(
                                    //                             "Cancel",
                                    //                             style: TextStyle(
                                    //                                 fontSize:
                                    //                                     16,
                                    //                                 color:
                                    //                                     primaryColor),
                                    //                           )),
                                    //                       TextButton(
                                    //                           onPressed: () {
                                    //                             clearAllPlaylist();
                                    //                             Navigator.of(
                                    //                                     context)
                                    //                                 .pop();
                                    //                             setState(() {
                                    //                               refreshPlayList();
                                    //                             });
                                    //                           },
                                    //                           child: const Text(
                                    //                             "Clear",
                                    //                             style: TextStyle(
                                    //                                 fontSize:
                                    //                                     16,
                                    //                                 color:
                                    //                                     primaryColor),
                                    //                           )),
                                    //                     ],
                                    //                   ));
                                    //         },
                                    //         child: Text(
                                    //           "Clear All",
                                    //           style: TextStyle(
                                    //               color: Colors.white70),
                                    //         ))
                                    //     : Text(""),
                                    IconButton(
                                        onPressed: () {
                                          // showDialog(
                                          //     context: context,
                                          //     builder: (context) => AlertDialog(
                                          //           content: PlayListAdd(),
                                          //         ));
                                          // setState(() {
                                          //   refreshPlayList();
                                          // });
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 27,
                                        )),
                                  ],
                                )
                              : const Text(""),
            ),
          ],
          bottom: curretnIndex == 0
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      height: 35,
                      color: color_smooth,
                      child: TabBar(
                        tabs: const [
                          Tab(
                            child: Text(
                              "Folders",
                              style: TextStyle(
                                  color: color_pureWhite, fontSize: 15),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Videos",
                              style: TextStyle(
                                  color: color_pureWhite, fontSize: 15),
                            ),
                          )
                        ],
                        indicatorColor: color_smooth,
                        indicatorWeight: 3,
                      ),
                    ),
                  ),
                )
              : null),
      preferredSize: curretnIndex == 0
          ? const Size.fromHeight(85)
          : const Size.fromHeight(50),
    );
  }

  myNavigationBar(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: BottomNavigationBar(
          backgroundColor: color_grey,
          currentIndex: curretnIndex,
          onTap: (index) => setState(() {
                curretnIndex = index;
              }),
          selectedIconTheme: IconThemeData(color: color_pureWhite, size: 30),
          unselectedIconTheme: IconThemeData(
            color: color_white,
          ),
          selectedFontSize: 12,
          iconSize: 26,
          // selectedItemColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.folder_outlined,
              ),
              label: "Home",
              activeIcon: Icon(Icons.folder_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: "Favorites",
              activeIcon: Icon(Icons.favorite_rounded),
            ),
            
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play_outlined),
              label: "Playlists",
              activeIcon: Icon(Icons.playlist_play_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_open_outlined),
              label: "Settings",
              activeIcon: Icon(Icons.menu_open_rounded),
            ),
          ]),
    );
  }
}
