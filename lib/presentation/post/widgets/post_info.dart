import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class PostInfo extends StatelessWidget {
  PostInfo({Key? key, required this.name, required this.price, required this.description, required this.seller}) : super(key: key);

  final String name;
  final String price;
  final String description;
  final String seller;

  late TextStyle style = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(name, style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          )),
          const SizedBox(height: 10),
          Text(description, style: style),
          const SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Vendedor: $seller",
                  style: style,
                ),
                Text(
                  "Precio(MXN): $price",
                  style: style,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton.extended(
                backgroundColor: AppTheme.thirdColor,
                heroTag: "buy",
                label: const Text("Comprar"),
                icon: const Icon(Icons.shop_outlined),
                onPressed: () {},
              ),
              FloatingActionButton.extended(
                backgroundColor: AppTheme.thirdColor,
                heroTag: "save",
                label: const Text("Agregar al carrito"),
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}