// ignore_for_file: use_key_in_widget_constructors

import 'package:address_crud/models/address.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  const AddressCard(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.home),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('STREET: ${address.street}'),
            Text('CEP: ${address.cep}'),
            Text('City: ${address.city}'),
            Text('State: ${address.state}'),
            Text('Number: ${address.number}'),
            Text('Complement: ${address.complement}'),
          ],
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
