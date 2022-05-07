import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final H;
  // ignore: prefer_typing_uninitialized_variables
  final W;
  const Gap({Key? key, double this.H = 0, double this.W = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: H,
      width: W,
    );
  }
}

sizeReduce({required mb}) {
  if (mb <= 1024) {
    return "$mb mb";
  }
  if (mb >= 1024) {
    var multy = mb ~/ 1024;

    return "${mb ~/ 1024}.${multy * mb - 1024} gb";
  }
}

pushToScreen({required BuildContext context,required page}) {
  return Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => page));
}
