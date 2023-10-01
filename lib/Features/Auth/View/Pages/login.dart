import 'package:book_store/Core/general_components/CustomCircularProgressIndicator.dart';
import 'package:book_store/Core/general_components/build_show_toast.dart';
import 'package:book_store/Core/general_components/main_button.dart';
import 'package:book_store/Core/my_validators.dart';
import 'package:book_store/Features/Auth/View/Pages/register.dart';
import 'package:book_store/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:book_store/Features/HomeScreen/View/Pages/HomePage.dart';
import 'package:book_store/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController =
        TextEditingController(text: 'ahmedabdelsattar28@gmail.com');
    _passwordController = TextEditingController(text: '12345678');
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool keepMeLogin = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Login to access your assigned tasks and personal overview.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) => MyValidators.emailValidator(value),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) =>
                          MyValidators.passwordValidator(value),
                      controller: _passwordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Password",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: keepMeLogin,
                          onChanged: (value) {
                            setState(() {
                              keepMeLogin = value!;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'keep Me Logged In',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildRegisterHereRichText(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildBlocConsumerMainButton(cubit),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildRegisterHereRichText() {
    return Row(
      children: [
        const Text('No account yet?'),
        TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                )),
            child: const Text('Register hare'))
      ],
    );
  }

  Widget buildBlocConsumerMainButton(LoginCubit cubit) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          if (LoginCubit.userData.user!.emailVerified!) {
            buildShowToast(state.successMessage);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false);
          } else {
            buildShowToast('You should verify your email');
          }
        }
        if (state is LoginError) {
          buildShowToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CustomCircularProgressIndicator();
        }
        return MainButton(
          text: 'Login',
          onTap: () {
            validateAndSubmit(cubit);
          },
        );
      },
    );
  }

  void validateAndSubmit(LoginCubit cubit) {
    if (_formKey.currentState!.validate()) {
      cubit.login(
        keepMeLogin: keepMeLogin,
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }
}
