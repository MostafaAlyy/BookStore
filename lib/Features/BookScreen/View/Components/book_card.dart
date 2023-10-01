import 'package:book_store/Features/BookScreen/Model/product_model.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.3,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.network(
                  book.image!,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Text(
                  '${book.discount}%',
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0.5, 1),
                        ),
                      ]),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${book.name}  ',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                ' ${book.price}',
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    shadows: []),
              ),
              const Spacer(),
              Text(
                '${book.priceAfterDiscount}  ',
                style: const TextStyle(color: Colors.black, shadows: []),
              ),
            ],
          )
        ],
      ),
    );
  }
}
