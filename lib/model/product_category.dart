class ProductCategory {
  final String title;
  final String? icon;
  final List<ProductCategory>? subCategories;

  ProductCategory(this.title, { this.icon, this.subCategories });
}
