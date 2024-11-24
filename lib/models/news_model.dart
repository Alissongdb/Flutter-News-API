class NewsModel {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
