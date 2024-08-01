class Cities_Data {
  final String name;
  final String country;
  final String imageUrl;
  final List<String> imageUrls;
  final String? description;

  Cities_Data({
    required this.name,
    required this.country,
    required this.imageUrl,
    required this.imageUrls,
    this.description
  
  });
}

