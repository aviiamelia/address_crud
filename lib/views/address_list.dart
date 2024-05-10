import 'package:address_crud/components/address_card.dart';
import 'package:address_crud/data/mock_address.dart';
import 'package:flutter/material.dart';

class AddressList extends StatelessWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = {...mock_address};
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Address List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.separated(
              itemCount: addresses.length,
              itemBuilder: (context, i) =>
                  AddressCard(addresses.values.elementAt(i)),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 8.0),
            ),
          )),
    );
  }
}
