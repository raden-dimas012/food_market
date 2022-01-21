part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final String? picturePath;
  static String? token;

  const User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

    factory User.fromJson(Map<String, dynamic> data) => User(
       id: data['id'],
       name: data['name'],
       email: data['email'],
       address: data['address'],
       houseNumber: data['houseNumber'],
       phoneNumber: data['phoneNumber'],
       city: data['city'],
       picturePath: data['profile_photo_url']
    );

    User copyWith({
      int? id,
      String? name,
      String? email,
      String? address,
      String? houseNumber,
      String? phoneNumber,
      String? city,
      String? picturePath,}
    ) => User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      houseNumber: houseNumber ?? this.houseNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      picturePath: picturePath ?? this.picturePath,
    );

  @override
  List<Object?> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = const User(
    id: 1,
    name: "Raden Dimas",
    email: "dimascode012@gmail.com",
    address: "JL Raden Wijaya",
    houseNumber: "162",
    phoneNumber: "085158901216",
    city: "Jambi",
    picturePath: "https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg");