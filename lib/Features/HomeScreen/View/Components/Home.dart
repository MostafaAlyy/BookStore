import 'package:book_store/Features/BookScreen/ViewModel/cubit/book_cubit.dart';
import 'package:book_store/Features/HomeScreen/VieewModel/cubit/home_cubit.dart';
import 'package:book_store/Features/HomeScreen/View/Components/HomeSlider.dart';
import 'package:book_store/Features/HomeScreen/View/Components/Home_appbar.dart';
import 'package:book_store/Features/HomeScreen/View/Components/books_slider.dart';
import 'package:book_store/Features/HomeScreen/View/Components/categorie_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cupit = HomeCubit.get(context);
        return SafeArea(
          child: BlocConsumer<BookCubit, BookState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var bookCupit = BookCubit.get(context);

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  HomeAppBar(cupit: cupit),
                  HomeSlider(cupit: cupit),
                  BooksSlider(
                    books: bookCupit.bestSellers,
                    sliderName: "Best Seller",
                  ),
                  CategorySlider(
                      categories: bookCupit.categories,
                      sliderName: "Categories"),
                  BooksSlider(
                    books: bookCupit.newArrivalBooks,
                    sliderName: "New Arrival",
                  )
                ]),
              );
            },
          ),
        );
      },
    );
  }
}
