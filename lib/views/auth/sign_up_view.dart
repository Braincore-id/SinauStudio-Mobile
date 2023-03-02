import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/models/user_model.dart';
import 'package:sinau_studio/view_models/auth_view_model.dart';
import 'package:sinau_studio/views/auth/auth_components/custom_login_button.dart';
import 'package:sinau_studio/views/auth/auth_components/text_field.dart';

class SignUpView extends ConsumerWidget {
  SignUpView({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Sinau Studio",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Detection of student focus level",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  TextFieldLogin(
                    controller: _nameController,
                    hintText: "Enter your name",
                    isPassword: false,
                    isEmail: false,
                    message: "Add name properly",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldLogin(
                    controller: _emailController,
                    hintText: "Enter your email",
                    isPassword: false,
                    isEmail: true,
                    message: "Please enter a valid email",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldLogin(
                    controller: _passwordController,
                    hintText: "Enter your password",
                    isPassword: true,
                    isEmail: false,
                    message: "Add password properly",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Spacer(),
                  CustomLoginButton(
                    buttonName: "Sign Up",
                    onTap: () {
                      final isValidForm = _formKey.currentState!.validate();
                      if (isValidForm) {
                        final UserModel dataUser = UserModel(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            userClass: "2IA01",
                            role: "mahasiswa");
                        ref.watch(authViewModel).signUp(dataUser);
                        // Provider.of<AuthViewModel>(context, listen: false)
                        //     .signup(
                        //   context,
                        //   _nameController.text,
                        //   _emailController.text,
                        //   _passwordController.text,
                        // );
                        // // Future.delayed(const Duration(seconds: 1));
                        // // if (prof.message != null) {
                        Navigator.pop(context);
                        // // }
                        // // Navigator.pop(context);
                      }
                    },
                  ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // const Text('OR'),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // const Spacer(
                  //   flex: 1,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Spacer(
                    flex: 3,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('asdasd'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
