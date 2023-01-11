class MovieModel {
  final String id;
  final String slug;
  final String title;
  final String overview;
  final String tagline;
  final String classification;
  final duration;
  final String releaseDate;
  final imdbRate;

  MovieModel(this.id, this.slug, this.title, this.overview, this.tagline,
      this.classification, this.duration, this.releaseDate, this.imdbRate);

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        slug = json["slug"],
        title = json["title"],
        overview = json["overview"] ?? "",
        tagline = json["tagline"] ?? "",
        classification = json["classification"],
        duration = json["runtime"] ?? 0,
        releaseDate = json["released_on"] == "" ? null : json["released_on"],
        imdbRate = json["imdb_rating"] == null
            ? 0.0
            : double.parse(json["imdb_rating"].toString());
}
