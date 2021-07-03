import 'dart:convert';

class AddressModel {
  final String street;
  final String? district;
  final int number;
  final String city;
  final String? complement;
  AddressModel({
    required this.street,
    this.district,
    required this.number,
    required this.city,
    this.complement,
  });

  AddressModel copyWith({
    String? street,
    String? district,
    int? number,
    String? city,
    String? complement,
  }) {
    return AddressModel(
      street: street ?? this.street,
      district: district ?? this.district,
      number: number ?? this.number,
      city: city ?? this.city,
      complement: complement ?? this.complement,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'district': district,
      'number': number,
      'city': city,
      'complement': complement,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'],
      district: map['district'],
      number: map['number'],
      city: map['city'],
      complement: map['complement'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(street: $street, district: $district, number: $number, city: $city, complement: $complement)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressModel &&
        other.street == street &&
        other.district == district &&
        other.number == number &&
        other.city == city &&
        other.complement == complement;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        district.hashCode ^
        number.hashCode ^
        city.hashCode ^
        complement.hashCode;
  }
}
