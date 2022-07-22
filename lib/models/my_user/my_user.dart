import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  const MyUser(
    this.id,
    this.name,
    this.description,
    this.address,
    this.email,
    {this.image}
  );

  final String id;
  final String name;
  final String description;
  final String address;
  final String email;
  final String? image;

  @override
  List<Object?> get props => [id];

  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?> {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'email': email,
      'image': newImage ?? image,
    };
  }

  MyUser.fromFirebaseMap(Map<String, Object?> data)
    : id = data['id'] as String,
      name = data['name'] as String,
      description = data['description'] as String,
      address = data['address'] as String,
      email = data['email'] as String,
      image = data['image'] as String?;
}