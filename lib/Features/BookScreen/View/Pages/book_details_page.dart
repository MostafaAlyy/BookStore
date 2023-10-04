import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Core/general_components/build_show_toast.dart';
import 'package:book_store/Features/BookScreen/Model/product_model.dart';
import 'package:book_store/Features/Cart/ViewModel/cubit/cart_cubit.dart';
import 'package:book_store/Features/Favorite/ViewModel/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cupit = FavoriteCubit.get(context);
        return Scaffold(
          floatingActionButton: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    (FavoriteCubit.isFavorite[book.name] ?? false)
                        ? cupit.removeToFavorite(book: book)
                        : cupit.addToFavorite(book: book);
                  },
                  child: Icon(
                    (FavoriteCubit.isFavorite[book.name] ?? false)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: ColorHelper.mainColor,
                  )),
              const Spacer(),
              FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    CartCubit.get(context).addToCart(book: book);
                    buildShowToast('Added to cart');
                  },
                  child: const Icon(
                    Icons.shopping_cart_checkout,
                    color: ColorHelper.mainColor,
                  )),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Image.network(
                        book.image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.name!,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${book.category}  ',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                ' ${book.price}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    shadows: []),
                              ),
                              Text(
                                '${(double.parse(book.price!) * ((book.discount! - 100).abs() / 100)).round()}.00  ',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    shadows: []),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      HtmlWidget(book.description!)
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
