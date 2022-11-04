import 'dart:convert';

class Product {
	int? id;
	String? name;
	int? price;
	String? description;
	String? imageUrl;

	Product({
		this.id, 
		this.name, 
		this.price, 
		this.description, 
		this.imageUrl, 
	});

	@override
	String toString() {
		return 'Product(id: $id, name: $name, price: $price, description: $description, imageUrl: $imageUrl)';
	}

	factory Product.fromMap(Map<String, dynamic> data) => Product(
				id: data['id'] as int?,
				name: data['name'] as String?,
				price: data['price'] as int?,
				description: data['description'] as String?,
				imageUrl: data['imageUrl'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'name': name,
				'price': price,
				'description': description,
				'imageUrl': imageUrl,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Product].
	factory Product.fromJson(String data) {
		return Product.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
	String toJson() => json.encode(toMap());
}
