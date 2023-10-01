import 'package:book_store/Features/BookScreen/Model/book_categorie.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final BookCategoric category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.118,
      width: MediaQuery.of(context).size.height * 0.118,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(12)),
            child: Image.asset(
              'assets/Images/books.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.118,
            width: MediaQuery.of(context).size.height * 0.118,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Text(
                '${category.name}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
