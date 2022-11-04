import 'package:flutter/material.dart';
import 'package:furniture_app/api/api.dart';
import 'package:furniture_app/gen/assets.gen.dart';
import 'package:furniture_app/models/products/product.dart';
import 'package:furniture_app/screens/details_screen.dart';
import 'package:furniture_app/widgets/category_list.dart';
import 'package:furniture_app/widgets/product_card.dart';
import 'package:furniture_app/widgets/search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: Assets.images.notification.svg(),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xFF035AA6),
      body: Column(
        children: [
          SearchBox(onChanged: (value) {}),
          const CategoryList(),
          const SizedBox(height: 20.0 / 2),
          Expanded(
            child: FutureBuilder<List<Product>?>(
              future: Api().getProducts(),
              builder: (context, snapshots) {
                if (snapshots.hasData) {
                  final products = snapshots.data;
                  if (products == null || products.isEmpty) {
                    return const Center(
                      child: Text("No items found"),
                    );
                  }
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 70),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF1EFF1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: products.length,
                        itemBuilder: (context, index) => ProductCard(
                          itemIndex: index,
                          product: products[index],
                          pressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  product: products[index],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
