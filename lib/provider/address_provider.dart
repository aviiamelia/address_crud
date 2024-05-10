// ignore_for_file: unnecessary_null_comparison, collection_methods_unrelated_type
import 'package:address_crud/models/address.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Addresses with ChangeNotifier {
  List<Address> _items = [];

  List<Address> get all {
    return [..._items];
  }

  int get count {
    return _items.length;
  }

  get isLoading => null;

  Address byIndex(int i) {
    return _items[i];
  }

  Future<void> fetchAddresses() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3333/address'));
      final data = json.decode(response.body) as List<dynamic>;
      _items = data.map((item) => Address.fromJson(item)).toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching addresses: $error');
    }
  }

  Future<void> createAddress(Address address) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3333/address'),
        body: json.encode(address.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      final newAddress = Address.fromJson(json.decode(response.body));
      _items.add(newAddress);
      notifyListeners();
    } catch (error) {
      print('Error creating address: $error');
    }
  }

  Future<void> updateAddress(Address address) async {
    try {
      print(address.id);
      final response = await http.put(
        Uri.parse('http://localhost:3333/address/${address.id}'),
        body: json.encode(address.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final updatedData = json.decode(response.body);
        final updatedAddress = Address.fromJson(updatedData);

        _items = _items.map((address) {
          if (address.id == updatedAddress.id) {
            return updatedAddress;
          }
          return address;
        }).toList();

        notifyListeners();
      } else {
        print('Failed to update address: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating address: $error');
    }
  }

  Future<void> remove(Address address) async {
    try {
      await http.delete(
        Uri.parse('http://localhost:3333/address/${address.id}'),
        headers: {'Content-Type': 'application/json'},
      );

      _items.remove(address);
      notifyListeners();
    } catch (error) {
      print('Error creating address: $error');
    }
  }
}
