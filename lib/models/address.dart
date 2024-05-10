// ignore_for_file: invalid_required_named_param

class Address {
  final int id;
  final String street;
  final String cep;
  final String state;
  final String city;
  final String complement;
  final String number;

  const Address({
    required this.id,
    required this.cep,
    required this.street,
    required this.city,
    this.complement = "",
    required this.number,
    required this.state,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'street': street,
      'cep': cep,
      'state': state,
      'city': city,
      'complement': complement,
      'number': number,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      street: json['street'],
      cep: json['cep'],
      state: json['state'],
      city: json['city'],
      complement: json['complement'],
      number: json['number'],
    );
  }
}
