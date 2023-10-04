import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Features/Cart/View/Components/cart_book_card.dart';
import 'package:book_store/Features/BookScreen/View/Components/book_search_card..dart';
import 'package:book_store/Features/Favorite/ViewModel/cubit/favorite_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cupit = FavoriteCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ConditionalBuilder(
            condition: cupit.favoriteBooks.isNotEmpty,
            builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    SearchBookCard(book: cupit.favoriteBooks[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: cupit.favoriteBooks.length),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(
              color: ColorHelper.mainColor,
            )),
          ),
        );
      },
    );
  }
}
