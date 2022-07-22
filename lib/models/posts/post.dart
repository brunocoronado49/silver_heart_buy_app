import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post(this.id, this.name, this.description, this.price, this.seller, this.material, this.image);

  final String id;
  final String name;
  final String description;
  final String price;
  final String seller;
  final String material;
  final String? image;

  @override
  List<Object?> get props => [id];

  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?> {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'seller': seller,
      'material': material,
      'image': newImage ?? image
    };
  }

  Post.fromFirebaseMap(Map<String, Object?> data)
    : id = data["id"] as String,
    name = data["name"] as String,
    description = data["description"] as String,
    price = data["price"] as String,
    seller = data["seller"] as String,
    material = data["material"] as String,
    image = data["image"] as String?;
}