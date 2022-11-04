import 'package:flutter/material.dart';
import 'package:furniture_app/gen/assets.gen.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0 / 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Assets.images.search.svg(),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
