import 'package:book_store/Features/BookScreen/Model/book_categorie.dart';
import 'package:book_store/Features/HomeScreen/View/Components/category_card.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider(
      {super.key, required this.categories, required this.sliderName});
  final String sliderName;
  final List<BookCategoric> categories;

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
            height: MediaQuery.of(context).size.height * 0.118,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    CategoryCard(category: categories[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                itemCount: categories.length),
          )
        ],
      ),
    );
  }
}
