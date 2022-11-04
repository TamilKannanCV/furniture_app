import 'package:flutter/material.dart';
import 'package:furniture_app/gen/assets.gen.dart';
import 'package:furniture_app/models/products/product.dart';
import 'package:furniture_app/widgets/chat_and_add_to_cart.dart';
import 'package:furniture_app/widgets/list_of_colors.dart';
import 'package:furniture_app/widgets/product_poster.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF035AA6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1EFF1),
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Assets.images.cartWithItem.svg(),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Color(0xFFF1EFF1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Hero(
                      tag: '${product.id}',
                      child: ProductPoster(
                        size: size,
                        image: "${product.imageUrl}",
                      ),
                    ),
                  ),
                  const ColorsList(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0 / 2),
                    child: Text(
                      "${product.name}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFA41B),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0 / 2),
                    child: Text(
                      "${product.description}",
                      style: const TextStyle(color: Color(0xFF747474)),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            const ChatAndAddToCart(),
          ],
        ),
      ),
    );
  }
}
