import 'Rating.dart';

class ProductsModel {

  ProductsModel({
      this.id, 
      this.title, 
      this.price, 
      this.description, 
      this.category, 
      this.image, 
      this.rating,});

  ProductsModel.fromJson(Map<String,dynamic> json) {
    id = json['id'].toString();
    title = json['title'].toString();
    price = json['price'].toString();
    description = json['description'].toString();
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }
  String? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    map['category'] = category;
    map['image'] = image;
    if (rating != null) {
      map['rating'] = rating!.toJson();
    }
    return map;
  }

}