import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Core/general_components/build_show_toast.dart';
import 'package:book_store/Core/general_components/defult_text_form_field.dart';
import 'package:book_store/Core/general_components/main_button.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/Cart/View/Components/city_drop_down.dart';
import 'package:book_store/Features/Cart/ViewModel/cubit/cart_cubit.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future showCheckOutDialog({
  required BuildContext context,
}) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Sign In",
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 1.1,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: const CheckOutDialogBody(),
          ),
        );
      });
}

class CheckOutDialogBody extends StatefulWidget {
  const CheckOutDialogBody({super.key});

  @override
  State<CheckOutDialogBody> createState() => _CheckOutDialogBodyState();
}

class _CheckOutDialogBodyState extends State<CheckOutDialogBody> {
  final TextEditingController nameController =
      TextEditingController(text: LoginCubit.userData.user!.name!);

  final TextEditingController emailController =
      TextEditingController(text: LoginCubit.userData.user!.email!);

  final TextEditingController phoneController =
      TextEditingController(text: LoginCubit.userData.user!.phone!);

  final TextEditingController addressController =
      TextEditingController(text: LoginCubit.userData.user!.address!);

  late SingleValueDropDownController governorateController;
  @override
  void initState() {
    governorateController = SingleValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    governorateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is PlaceOrderSuccessState) {
          buildShowToast(state.message);
        }
      },
      builder: (context, state) {
        var cupit = CartCubit.get(context);
        return Center(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    defaultTextFormFelid(
                        text: "name",
                        controller: nameController,
                        prefixIcon: const Icon(Icons.person),
                        fillColor: ColorHelper.mainColor),
                    defaultTextFormFelid(
                        text: "email",
                        enabled: false,
                        controller: emailController,
                        prefixIcon: const Icon(Icons.email),
                        fillColor: ColorHelper.mainColor),
                    defaultTextFormFelid(
                        text: "phone",
                        controller: phoneController,
                        prefixIcon: const Icon(Icons.phone),
                        fillColor: ColorHelper.mainColor),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CityDropDown(
                        controller: governorateController,
                        hint: "Select Governorate",
                        list: cupit.governesses,
                      ),
                    ),
                    defaultTextFormFelid(
                        text: "address",
                        controller: addressController,
                        prefixIcon: const Icon(Icons.location_on_outlined),
                        fillColor: ColorHelper.mainColor),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: MainButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            cupit.placeOrder(
                                name: nameController.text,
                                governorateId: governorateController
                                    .dropDownValue!.value
                                    .toString(),
                                phone: phoneController.text,
                                address: addressController.text,
                                email: emailController.text);
                          }
                        },
                        text: "Confirm data",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
