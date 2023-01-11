class BookModel {
  final String? title;
  final String? description;
  final String? categories;
  final String? publishdate;
  final String? language;
  String? taskid;

  BookModel(
      {this.title,
      this.description,
      this.categories,
      this.publishdate,
      this.language,
      this.taskid});

  factory BookModel.fromMap(Map<String, dynamic> json) {
    return BookModel(
      title: json['volumeInfo']['title'] != null
          ? json['volumeInfo']['title']!
          : 'Loading...',
      description: json['volumeInfo']['description'] != null
          ? json['volumeInfo']['description']!
          : 'There is no description',
      categories: json['volumeInfo']['categories'] != null
          ? json['volumeInfo']['categories'][0]!
          : 'No Data...',
      publishdate: json['volumeInfo']['publishedDate'] != null
          ? json['volumeInfo']['publishedDate']!
          : 'No Data...',
      language: json['volumeInfo']['language'] != null
          ? json['volumeInfo']['language']!
          : 'No Data...',
    );
  }
}
