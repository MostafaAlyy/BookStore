import 'package:book_store/Features/BookScreen/Model/search_field.dart';
import 'package:book_store/Features/BookScreen/ViewModel/cubit/book_cubit.dart';
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
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SearchField(searchController: searchController, cupit: cupit),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Image.network(
                                    cupit.searchBooks[index].image!,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              ]),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: cupit.searchBooks.length),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
