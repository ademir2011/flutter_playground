class Me {
  final String urlImage;
  final String name;
  final String description;
  final List<String> socialNetworksUrl;
  final Map<String, double> habilities;

  Me({
    required this.urlImage,
    required this.name,
    required this.description,
    this.socialNetworksUrl = const [],
    this.habilities = const {},
  });
}
