// ignore_for_file: unnecessary_null_comparison, collection_methods_unrelated_type

import 'package:address_crud/data/mock_address.dart';
import 'package:address_crud/models/address.dart';
import 'package:flutter/material.dart';

class Addresses with ChangeNotifier {
  Map<String, Address> _items = {...mock_address};

  List<Address> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Address byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Address address) {
    if (address == null) {
      return;
    }

    if (address.id != null &&
        address.id.trim().isNotEmpty &&
        _items.containsKey(address.id)) {
      _items.update(
          address.id,
          (value) => Address(
              id: address.id,
              cep: address.cep,
              street: address.street,
              city: address.city,
              number: address.number,
              state: address.state));
    } else {
      _items.putIfAbsent(
          address.id,
          () => Address(
                id: address.id,
                cep: address.cep,
                city: address.city,
                street: address.street,
                number: address.number,
                state: address.state,
              ));
    }

    notifyListeners();
  }

  void remove(Address address) {
    if (address != null && address.id != null) {
      _items.remove(address.id);
      notifyListeners();
    }
  }
}
