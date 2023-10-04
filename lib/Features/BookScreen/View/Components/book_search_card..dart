import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Core/general_components/build_show_toast.dart';
import 'package:book_store/Features/BookScreen/Model/product_model.dart';
import 'package:book_store/Features/BookScreen/View/Pages/book_details_page.dart';
import 'package:book_store/Features/Cart/ViewModel/cubit/cart_cubit.dart';
import 'package:book_store/Features/Favorite/ViewModel/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookCard extends StatelessWidget {
  const SearchBookCard({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cupit = FavoriteCubit.get(context);
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(
                    book: book,
                  ),
                ));
          },
          child: Container(
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
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12)),
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
                        '${(double.parse(book.price!) * ((book.discount! - 100).abs() / 100)).round()}.00  ',
                        style:
                            const TextStyle(color: Colors.black, shadows: []),
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
                          onPressed: () {
                            (FavoriteCubit.isFavorite[book.name] ?? false)
                                ? cupit.removeToFavorite(book: book)
                                : cupit.addToFavorite(book: book);
                          },
                          icon: Icon(
                            (FavoriteCubit.isFavorite[book.name] ?? false)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: ColorHelper.mainColor,
                          )),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            CartCubit.get(context).addToCart(book: book);
                            buildShowToast('Added to cart');
                          },
                          icon: const Icon(
                            Icons.shopping_cart_checkout,
                            color: ColorHelper.mainColor,
                          ))
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
