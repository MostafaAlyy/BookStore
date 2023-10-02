import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Features/BookScreen/Model/product_model.dart';
import 'package:flutter/material.dart';

class SearchBookCard extends StatelessWidget {
  const SearchBookCard({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.3,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(12)),
            child: Image.network(
              book.image!,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${book.name}  ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${book.category}  ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Text(
                  ' ${book.price}',
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      shadows: []),
                ),
                Text(
                  '${book.priceAfterDiscount}  ',
                  style: const TextStyle(color: Colors.black, shadows: []),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: ColorHelper.mainColor,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_checkout,
                      color: ColorHelper.mainColor,
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
