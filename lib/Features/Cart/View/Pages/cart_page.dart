import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Features/Cart/View/Components/cart_book_card.dart';
import 'package:book_store/Features/Cart/View/Components/confirm_check_out_dialog.dart';
import 'package:book_store/Features/Cart/ViewModel/cubit/cart_cubit.dart';
import 'package:book_store/Features/Favorite/ViewModel/cubit/favorite_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cupit = CartCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ConditionalBuilder(
            condition: cupit.cartBooks.isNotEmpty,
            builder: (context) => SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorHelper.mainColor),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(children: [
                        Text(
                          "The total price : ${cupit.total}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              showCheckOutDialog(context: context);
                            },
                            child: const Text(
                              'CheckOut',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorHelper.mainColor),
                            ))
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            CartBookCard(book: cupit.cartBooks[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: cupit.cartBooks.length),
                  ),
                ],
              ),
            ),
            fallback: (context) => Center(
                child: (state is GetCartBooksLoadingState)
                    ? const CircularProgressIndicator(
                        color: ColorHelper.mainColor,
                      )
                    : const Text("The Cart is Empty")),
          ),
        );
      },
    );
  }
}
