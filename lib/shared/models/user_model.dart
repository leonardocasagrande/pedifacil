import 'dart:convert';

import 'package:pedifacil/shared/models/address_model.dart';

class UserModel {
  final String name;
  final AddressModel? address;
  final String? phone;
  UserModel({
    required this.name,
    this.address,
    this.phone,
  });

  UserModel copyWith({
    String? name,
    AddressModel? address,
    String? phone,
  }) {
    return UserModel(
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address?.toMap(),
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      address:
          map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(name: $name, address: $address, phone: $phone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.address == address &&
        other.phone == phone;
  }

  @override
  int get hashCode => name.hashCode ^ address.hashCode ^ phone.hashCode;
}
