import 'package:address_crud/provider/address_provider.dart';
import 'package:address_crud/routes/app_routes.dart';
import 'package:address_crud/views/address_form.dart';
import 'package:address_crud/views/address_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Addresses(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.ADDRESS_FORM: (_) => AddressForm(),
          AppRoutes.HOME: (_) => const AddressList()
        },
      ),
    );
  }
}
