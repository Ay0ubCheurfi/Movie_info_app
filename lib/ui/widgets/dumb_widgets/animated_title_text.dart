import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../helpers/sizing_info.dart';
import '../../views/home/home_viewmodel.dart';

class AnimatedText extends ViewModelWidget<HomeViewModel> {
  const AnimatedText({Key? key}) : super(key: key);

//  final int index;

  @override
  Widget build(BuildContext context, model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          model.popularMovies![model.pageIndex].title!,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize:
                  percentageOfScreenHeight(context: context, percentage: .035)),
        ),
        // .translate(
        //   offset: Offset(
        //       index == model.pageIndex
        //           ? 0
        //           : index < model.pageIndex + 1
        //               ? -100
        //               : 100,
        //       0),
        //   animate: true,
        // )
        // .animate(
        //     Duration(milliseconds: 600), Curves.fastLinearToSlowEaseIn),
        Text(
          model.popularMovies![model.pageIndex].title!,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize:
                  percentageOfScreenHeight(context: context, percentage: .02)),
        ),
      ],
    ).padding(top: percentageOfScreenHeight(context: context, percentage: .1));
  }
}
