// class Product
// {
//   late int id;
//   late String title;
//   late String description;
//   late dynamic price;
//   late String category;
//   late String image;
//   late List<String> images;
//
//   Product({required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.category,
//     required this.image,
//     required this.images
//   });
//
//   factory Product.fromJson( Map<String,dynamic> json){
//     var imageFromJson  = json['images'];
//     List<String> imageList = imageFromJson.cast<String>();
//
//     return Product(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       price: json['price'],
//       category: json['category'],
//       image: json['image'],
//       images: imageList,
//     );
//
//
//
//
//
//
//   }
//
// }
//
// class Images{
//   String images;
//   Images(this.images);
//
// }
// class ProductList {
//   final List<Product> product;
//
//   ProductList({
//     required this.product,
//   });
//
//
//   factory ProductList.fromJson(List<dynamic> parsedJson) {
//     List<Product> product = <Product>[];
//     product = parsedJson.map((i)=>Product.fromJson(i)).toList();
//     return ProductList(
//       product: product,
//     );
//   }
// }


class Product {
  late int id;
  late String title;
  late dynamic price;
  late String description;
  late String category;
  late String image;
  late Rating rating;

  Product(
      {
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = (json['rating'] != null ? new Rating.fromJson(json['rating']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    return data;
  }
}

class Rating {
 late dynamic rate;
  late int count;

  Rating({required this.rate, required this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
