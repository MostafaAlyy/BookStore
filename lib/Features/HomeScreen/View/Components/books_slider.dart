import 'package:book_store/Features/BookScreen/Model/product_model.dart';
import 'package:book_store/Features/BookScreen/View/Components/book_card.dart';
import 'package:flutter/material.dart';

class BooksSlider extends StatelessWidget {
  const BooksSlider({super.key, required this.books, required this.sliderName});
  final String sliderName;
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                sliderName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => BookCard(book: books[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                itemCount: books.length),
          )
        ],
      ),
    );
  }
}
