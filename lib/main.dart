import 'package:cart_project/controller/cart_provider.dart';
import 'package:cart_project/core/sql_server.dart';
import 'package:cart_project/modules/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider()..getCounter(),
      child: Builder(
        builder: (BuildContext context) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ProductScreen(),
          );
        },
      ),
    );
  }
}
