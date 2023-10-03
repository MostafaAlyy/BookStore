import 'package:book_store/Core/ColorHelper.dart';
import 'package:book_store/Core/general_components/build_show_toast.dart';
import 'package:book_store/Core/general_components/defult_text_form_field.dart';
import 'package:book_store/Core/general_components/main_button.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/Profile/View/Components/profile_app_bar.dart';
import 'package:book_store/Features/Profile/ViewModel/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController nameController;

  late TextEditingController emailController;

  late TextEditingController phoneController;

  late TextEditingController cityController;

  late TextEditingController addressController;

  @override
  void initState() {
    // TODO: implement initState
    nameController =
        TextEditingController(text: LoginCubit.userData.user!.name!);
    emailController =
        TextEditingController(text: LoginCubit.userData.user!.email!);
    phoneController =
        TextEditingController(text: LoginCubit.userData.user!.phone!);
    cityController =
        TextEditingController(text: LoginCubit.userData.user!.city!);
    addressController =
        TextEditingController(text: LoginCubit.userData.user!.address!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is UpdateProfileDateSuccessState) {
            buildShowToast('Edited Successfully');
          }
        },
        builder: (context, state) {
          var cupit = ProfileCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                const ProfileAppBar(),
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
                defaultTextFormFelid(
                    text: "city",
                    controller: cityController,
                    prefixIcon: const Icon(Icons.location_city),
                    fillColor: ColorHelper.mainColor),
                defaultTextFormFelid(
                    text: "address",
                    controller: addressController,
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    fillColor: ColorHelper.mainColor),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: MainButton(
                    onTap: () {
                      cupit.updateProfileData(
                          name: nameController.text,
                          address: addressController.text,
                          city: cityController.text,
                          phone: phoneController.text);
                    },
                    text: "Edit Profile Data",
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
