import 'package:address_crud/components/address_card.dart';
import 'package:address_crud/provider/address_provider.dart';
import 'package:address_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressList extends StatelessWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context) {
    final Addresses addresses = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Address List",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.ADDRESS_FORM);
                },
                icon: const Icon(Icons.add))
          ],
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: const Color.fromARGB(255, 199, 193, 193),
          child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                  itemCount: addresses.count,
                  itemBuilder: (context, i) =>
                      AddressCard(addresses.byIndex(i)),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 8.0),
                ),
              )),
        ));
  }
}
