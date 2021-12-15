import 'dart:ui';

class Product {
  String name;
  String image;
  String shortDescription;
  String description;
  String category;
  double price;
  double rating;

  Product(
    this.name,
    this.image,
    this.shortDescription,
    this.description,
    this.category,
    this.price,
    this.rating,
  );
}

class CarouselProduct {
  String name;
  String image;
  double price;
  Offset offset;
  bool isFlipped;

  CarouselProduct(
    this.name,
    this.image,
    this.price,
    this.offset,
    this.isFlipped,
  );
}
