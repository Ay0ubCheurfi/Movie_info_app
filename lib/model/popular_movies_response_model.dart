// To parse this JSON data, do
//
//     final popularMoviesResponseModel = popularMoviesResponseModelFromJson(jsonString);

import 'dart:convert';

import 'movie_model.dart';

PopularMoviesResponseModel popularMoviesResponseModelFromJson(String str) =>
    PopularMoviesResponseModel.fromJson(json.decode(str));

String popularMoviesResponseModelToJson(PopularMoviesResponseModel data) =>
    json.encode(data.toJson());

class PopularMoviesResponseModel {
  PopularMoviesResponseModel({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  int? page;
  List<Movie>? results;
  int? totalResults;
  int? totalPages;

  factory PopularMoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      PopularMoviesResponseModel(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_results": totalResults == null ? null : totalResults,
        "total_pages": totalPages == null ? null : totalPages,
      };
}
