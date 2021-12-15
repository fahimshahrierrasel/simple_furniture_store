import 'dart:ui';

import 'product_category.dart';
import 'product.dart';

List<ProductCategory> getCategories() {
  return [
    ProductCategory("All", icon: "assets/icons/almirah.png"),
    ProductCategory("Chair", icon: "assets/icons/chair.png", subCategories: [
      ProductCategory("Living Room"),
      ProductCategory("Dining Room"),
      ProductCategory("Bedroom"),
      ProductCategory("Kitchen")
    ]),
    ProductCategory("Lamp", icon: "assets/icons/lamp.png"),
    ProductCategory("Sofa", icon: "assets/icons/sofa.png"),
    ProductCategory("Bed", icon: "assets/icons/bed.png"),
  ];
}

List<Product> getPopularProducts() {
  return [
    Product(
      "Brown Velvet Chair",
      "assets/images/chair-1.jpg",
      "Byssuss ire in velox caelos!",
      "Zelus, era, et repressor. Paluss cantare, tanquam peritus decor. Bassus, castus brabeutas patienter imitari de primus, mirabilis hibrida. Ubi est teres accentor? Sunt fraticinidaes carpseris altus, bassus urbses. Cum era manducare, omnes liberies fallere gratis, fatalis byssuses.",
      "Chair",
      230,
      4.8,
    ),
    Product(
      "Rocking Chair",
      "assets/images/chair-2.jpg",
      "Peritus messors ducunt ad guttus!",
      "Sunt finises contactus bassus, nobilis sagaes. Rumors sunt consiliums de flavum accola. Albus, peritus eras virtualiter locus de altus, pius sensorem. Pol. Bubos crescere, tanquam rusticus secula. Fortis zirbus mechanice manifestums lactea est. Musa de primus luba, magicae fuga! Rumor nobilis stella est. Cum vortex peregrinationes, omnes fermiumes convertam lotus, fatalis poetaes.",
      "Chair",
      140,
      4.9,
    ),
    Product(
      "Stylish Chair",
      "assets/images/chair-3.jpg",
      "Lacteas ortum, tanquam alter fortis!",
      "Lubas ire in hamburgum! Cum xiphias mori, omnes abaculuses captis gratis, bassus castores. A falsis, rumor ferox advena. Bromium fidelis olla est. Cur cacula studere? Eheu, hilotae! A falsis, solem velox repressor. Triticums accelerare in vierium! Gloss cadunt, tanquam peritus particula. Cum buxum favere, omnes exsules gratia emeritis, noster parses.",
      "Chair",
      170,
      4.8,
    )
  ];
}

List<CarouselProduct> getCarouselProducts() {
  return [
    CarouselProduct(
      "Brown Velvet Chair",
      "assets/images/chair-1.jpg",
      230,
      Offset(300, 180),
      true
    ),
    CarouselProduct(
      "Rocking Chair",
      "assets/images/chair-2.jpg",
      140,
      Offset(340, 320),
      true
    ),
    CarouselProduct(
      "Stylish Chair",
      "assets/images/chair-3.jpg",
      170,
      Offset(170, 230),
      false
    )
  ];
}
