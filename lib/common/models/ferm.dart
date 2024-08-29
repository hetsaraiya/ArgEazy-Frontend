class PriceItem {
  final String name;
  final String description;

  PriceItem({required this.name, required this.description});

  factory PriceItem.fromJson(Map<String, dynamic> json) {
    return PriceItem(
      name: json['name'],
      description: json['description'],
    );
  }
}