class City {
  int id;
  String name;
  String imageUrl;
  bool isFavorited;

  City({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorited = false,
  });
}
