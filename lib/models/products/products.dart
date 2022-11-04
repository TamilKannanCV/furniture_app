import 'dart:convert';

import 'product.dart';

class Products {
	List<Product>? products;

	Products({this.products});

	@override
	String toString() => 'Products(products: $products)';

	factory Products.fromMap(Map<String, dynamic> data) => Products(
				products: (data['products'] as List<dynamic>?)
						?.map((e) => Product.fromMap(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toMap() => {
				'products': products?.map((e) => e.toMap()).toList(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Products].
	factory Products.fromJson(String data) {
		return Products.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Products] to a JSON string.
	String toJson() => json.encode(toMap());
}
