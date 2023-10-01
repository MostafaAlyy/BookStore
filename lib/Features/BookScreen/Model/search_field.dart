import 'package:book_store/Features/BookScreen/ViewModel/cubit/book_cubit.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
    required this.cupit,
  });

  final TextEditingController searchController;
  final BookCubit cupit;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color.fromARGB(255, 184, 184, 184)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          controller: searchController,
          onChanged: (value) {
            cupit.searchGetBooks(value);
          },
          decoration: const InputDecoration(
            labelText: 'Search',
            prefixIconColor: Colors.white,
            icon: Icon(Icons.search),
            iconColor: Colors.white,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
