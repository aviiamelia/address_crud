// ignore_for_file: invalid_required_named_param

class Address {
  final String street;
  final String cep;
  final String state;
  final String city;
  final String complement;
  final String number;

  const Address({
    required this.cep,
    required this.street,
    required this.city,
    this.complement = "",
    required this.number,
    required this.state,
  });
}
