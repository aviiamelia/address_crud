// ignore_for_file: use_key_in_widget_constructors

import 'package:address_crud/models/address.dart';
import 'package:address_crud/provider/address_provider.dart';
import 'package:address_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  const AddressCard(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.home),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Street: ${address.street}'),
            Text('CEP: ${address.cep}'),
            Text('City: ${address.city}'),
            Text('State: ${address.state}'),
            Text('Number: ${address.number}'),
            Text('Complement: ${address.complement}'),
          ],
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.ADDRESS_FORM, arguments: address);
              },
              icon: const Icon(Icons.edit),
              color: Colors.orange,
            ),
            IconButton(
              onPressed: () {
                Provider.of<Addresses>(context, listen: false).remove(address);
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
