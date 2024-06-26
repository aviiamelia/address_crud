// ignore_for_file: unnecessary_null_comparison

import 'package:address_crud/models/address.dart';
import 'package:address_crud/provider/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final _form = GlobalKey<FormState>();
  bool isUpdate = false;
  final Map<String, String> _formData = {};
  void loadFormData(Address address) {
    if (address != null) {
      _formData['street'] = address.street;
      _formData['cep'] = address.cep;
      _formData['state'] = address.state;
      _formData['number'] = address.number;
      _formData['city'] = address.city;
      _formData['complement'] = address.complement;
      isUpdate = true;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)?.settings.arguments != null) {
      final address = ModalRoute.of(context)?.settings.arguments as Address;
      loadFormData(address);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new address"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _form.currentState?.save();
                if (isUpdate == true) {
                  final address =
                      ModalRoute.of(context)?.settings.arguments as Address;
                  Provider.of<Addresses>(context, listen: false).updateAddress(
                      Address(
                          id: address.id,
                          cep: _formData['cep']!,
                          street: _formData['street']!,
                          city: _formData['city']!,
                          number: _formData['number']!,
                          state: _formData['state']!,
                          complement: _formData['complement']!));
                } else {
                  Provider.of<Addresses>(context, listen: false).createAddress(
                      Address(
                          id: 0,
                          cep: _formData['cep']!,
                          street: _formData['street']!,
                          city: _formData['city']!,
                          number: _formData['number']!,
                          state: _formData['state']!,
                          complement: _formData['complement']!));
                }

                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                  initialValue: _formData['street'],
                  decoration: const InputDecoration(labelText: "Street"),
                  onSaved: (value) => _formData['street'] = value!),
              TextFormField(
                initialValue: _formData['cep'],
                decoration: const InputDecoration(labelText: "Cep"),
                onSaved: (value) => _formData['cep'] = value!,
              ),
              TextFormField(
                initialValue: _formData['state'],
                decoration: const InputDecoration(labelText: "State"),
                onSaved: (value) => _formData['state'] = value!,
              ),
              TextFormField(
                initialValue: _formData['city'],
                decoration: const InputDecoration(labelText: "City"),
                onSaved: (value) => _formData['city'] = value!,
              ),
              TextFormField(
                initialValue: _formData['complement'],
                decoration: const InputDecoration(labelText: "Complement"),
                onSaved: (value) => _formData['complement'] = value!,
              ),
              TextFormField(
                initialValue: _formData['number'],
                decoration: const InputDecoration(labelText: "Number"),
                onSaved: (value) => _formData['number'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
