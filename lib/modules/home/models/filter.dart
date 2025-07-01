class Filter {
  final String id;
  final String name;
  final String slug;

  Filter({required this.id, required this.name, required this.slug});

  factory Filter.fromJson(Map<String, dynamic> json, String id) {
    return Filter(name: json["name"], slug: json["slug"], id: id);
  }
}
