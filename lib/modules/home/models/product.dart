class Product {
  final String id;
  final String name;
  final String image;
  final String price;
  final String unit;
  final String producerName;
  final String description;
  final String categoryId;
  final String productCategorySlug;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.unit,
    required this.producerName,
    required this.description,
    required this.categoryId,
    required this.productCategorySlug,
  });

  factory Product.fromJson(Map<String, dynamic> json, String id) {
    return Product(
      id: id,
      name: json["name"],
      image: json["img"],
      price: json["price"].toString(),
      unit: json["unit"],
      producerName: json["produtor_id"].id,
      description: json["description"],
      categoryId: json["category_id"].id,
      productCategorySlug: json["product_category_slug"],
    );
  }
}

// category_id
// /produto_categoria/GhyB8KgGnvQFDRDpyedX
// (reference)


// description
// "Alface bem verdinho muito lindo bonito"
// (string)


// img
// "https://picsum.photos/300/300"
// (string)


// name
// "Alface"
// (string)


// price
// 300
// (number)


// product_category_slug
// "legume"
// (string)


// produtor_id
// /produtores/MW9FmciRz7CtzEL47NlD
// (reference)


// unit
// "kg"