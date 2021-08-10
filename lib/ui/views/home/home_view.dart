import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_app/ui/widgets/dumb_widgets/animated_title_text.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../widgets/dumb_widgets/back_image.dart';
import '../../widgets/dumb_widgets/movie_card.dart';
import 'home_viewmodel.dart';

class HomeView extends HookWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController = usePageController(viewportFraction: .83);
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? CircularProgressIndicator().center()
            : Stack(
                alignment: Alignment.topCenter,
                children: [
                  BackImage(),
                  Container()
                      .backgroundBlur(10)
                      .backgroundColor(Colors.black26),
                  PageView.builder(
                    controller: _pageController,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: model.onPageChanged,
                    itemCount: model.popularMovies!.length,
                    itemBuilder: (context, index) => MovieCard(
                      itemIndex: index,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: AnimatedText(
                      key: ValueKey<String>(
                          model.popularMovies![model.pageIndex].posterPath!),
                    ).alignment(Alignment.topCenter),
                  )
                ],
              ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
