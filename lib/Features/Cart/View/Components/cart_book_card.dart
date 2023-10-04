import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Features/BookScreen/Model/product_model.dart';
import 'package:book_store/Features/Cart/Model/cart_book_model.dart';
import 'package:book_store/Features/Cart/ViewModel/cubit/cart_cubit.dart';
import 'package:book_store/Features/Favorite/ViewModel/cubit/favorite_cubit.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBookCard extends StatefulWidget {
  const CartBookCard({
    super.key,
    required this.book,
  });

  final CartBook book;

  @override
  State<CartBookCard> createState() => _CartBookCardState();
}

class _CartBookCardState extends State<CartBookCard> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cupit = CartCubit.get(context);
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
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.network(
                  widget.book.itemProductImage!,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.book.itemProductName}  ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      ' ${(double.parse(widget.book.itemProductPrice!) * (widget.book.itemQuantity!).round())}0',
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          shadows: []),
                    ),
                    Text(
                      '${(double.parse(widget.book.itemProductPrice!) * ((widget.book.itemProductDiscount! - 100).abs() / 100)).round() * (widget.book.itemQuantity!).round()}.00  ',
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          cupit.removeFromCart(book: widget.book);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    const Spacer(),
                    CounterButton(
                      loading: false,
                      onChange: (int val) {
                        if (val >= 1) {
                          cupit.updateFromCart(book: widget.book, val: val);
                        }
                      },
                      removeIcon: (widget.book.itemQuantity == 1)
                          ? const Icon(
                              Icons.remove,
                              color: Colors.grey,
                            )
                          : const Icon(Icons.remove),
                      count: widget.book.itemQuantity!,
                      countColor: Colors.black,
                      buttonColor: Colors.orangeAccent,
                    )
                  ],
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
