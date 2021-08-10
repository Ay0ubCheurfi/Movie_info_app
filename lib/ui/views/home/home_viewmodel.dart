import 'package:movie_app/app/app.locator.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/service/api_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel<List<Movie>?> {
  final _apiService = locator<Api>();
  int _pageIndex = 0;

  List<Movie>? popularMovies = [];

  int get pageIndex => _pageIndex;

  onPageChanged(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  @override
  Future<List<Movie>?> futureToRun() async {
    popularMovies = await _apiService.getPopularMovies();
    return popularMovies;
  }
}
