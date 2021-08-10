import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../views/home/home_viewmodel.dart';

class BackImage extends ViewModelWidget<HomeViewModel> {
  const BackImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://image.tmdb.org/t/p/original' +
                model.popularMovies![model.pageIndex].posterPath!),
          ),
        ),
        key:
            ValueKey<String>(model.popularMovies![model.pageIndex].posterPath!),
      ),
    );
  }
}
