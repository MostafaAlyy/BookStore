import 'package:book_store/Features/BookScreen/Model/search_field.dart';
import 'package:book_store/Features/Cart/View/Components/cart_book_card.dart';
import 'package:book_store/Features/BookScreen/ViewModel/cubit/book_cubit.dart';
import 'package:book_store/Features/BookScreen/View/Components/book_search_card..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookSearch extends StatelessWidget {
  BookSearch({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cupit = BookCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SafeArea(
                  bottom: false,
                  child: SearchField(
                      searchController: searchController, cupit: cupit)),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        SearchBookCard(book: cupit.searchBooks[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: cupit.searchBooks.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
