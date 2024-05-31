import 'package:fake_store_package/catalog.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_package/domain/utils/category_enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Catalog catalog = Catalog();
  String _response = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda de Productos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result = await catalog.getProductsList();
                    setState(() {
                      _response = result.fold(
                        (products) => products
                            .map((product) => product.toString())
                            .join('\n\n'),
                        (error) => 'Error: $error',
                      );
                    });
                  },
                  child: const Text("Lista de Productos"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await catalog.getProduct(10);
                    setState(() {
                      _response = result.fold(
                        (product) => product.toString(),
                        (error) => 'Error: $error',
                      );
                    });
                  },
                  child: const Text("Producto"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await catalog
                        .getProductsInCategory(Category.electronics);
                    setState(() {
                      _response = result.fold(
                        (products) => products
                            .map((product) => product.toString())
                            .join('\n\n'),
                        (error) => 'Error: $error',
                      );
                    });
                  },
                  child: const Text("Productos por Categoría"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_response),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
