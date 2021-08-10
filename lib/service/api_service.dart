import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/model/popular_movies_response_model.dart';

class Api {
  //
  static const _apiKey = '1f65dd72ba46c73700950596518d309a';
  static const _readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZjY1ZGQ3MmJhNDZjNzM3MDA5NTA1OTY1MThkMzA5YSIsInN1YiI6IjYxMGZiYTYzOTYwY2RlMDA1YzdlNjVhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.czT_r6CNKWl-MJIDx7goZO6-uMauhsyre175cfx6p5g';
  static const _apiEndpoint = 'https://api.themoviedb.org/3';
  //

  Future<List<Movie>?> getPopularMovies({int pageNumber = 1}) async {
    final uri = Uri.parse(
        '$_apiEndpoint/movie/popular?api_key=$_apiKey&language=en-US&page=$pageNumber');
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: 'Basic $_apiKey',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(response.statusCode);

    if (response.statusCode == 200)
      return popularMoviesResponseModelFromJson(response.body).results;
    else
      return null;
  }
}
