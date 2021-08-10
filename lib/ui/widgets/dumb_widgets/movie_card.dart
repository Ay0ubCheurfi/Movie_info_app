import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../helpers/sizing_info.dart';
import '../../views/home/home_viewmodel.dart';

class MovieCard extends ViewModelWidget<HomeViewModel> {
  const MovieCard({Key? key, required this.itemIndex}) : super(key: key);

  final int itemIndex;

  @override
  Widget build(BuildContext context, model) {
    return Container(
      height: percentageOfScreenHeight(context: context, percentage: .68),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.black.withOpacity(.1),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        'https://image.tmdb.org/t/p/original' +
            model.popularMovies![itemIndex].posterPath!,
        fit: BoxFit.cover,
      )
          // .translate(
          //     offset: Offset(
          //         model.pageIndex == itemIndex
          //             ? 0
          //             : itemIndex < model.pageIndex + 1
          //                 ? percentageOfScreenHeight(
          //                     context: context, percentage: .08)
          //                 : -percentageOfScreenHeight(
          //                     context: context, percentage: .08),
          //         0),
          //     animate: true)
          .rotate(
              angle: model.pageIndex == itemIndex
                  ? 0
                  : itemIndex < model.pageIndex + 1
                      ? -pi / 15
                      : pi / 15,
              animate: true)
          .scale(
            all: model.pageIndex == itemIndex ? 1.0 : 1.37,
            alignment: Alignment.center,
            animate: true,
          )
          .animate(Duration(milliseconds: 350), Curves.decelerate),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black.withOpacity(.14),
            blurRadius: 20,
            spreadRadius: 10,
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
    )
        .width(double.infinity)
        .padding(
          top: percentageOfScreenHeight(
              context: context,
              percentage: itemIndex == model.pageIndex ? .31 : .35),
          horizontal: percentageOfScreenHeight(
              context: context,
              percentage: itemIndex == model.pageIndex ? 0 : .03),
          animate: true,
        )
        .animate(Duration(milliseconds: 600), Curves.fastLinearToSlowEaseIn);
  }
}
