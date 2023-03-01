import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinau_studio/models/user_model.dart';
import 'package:sinau_studio/view_models/auth_view_model.dart';
import 'package:sinau_studio/views/auth/auth_components/custom_login_button.dart';
import 'package:sinau_studio/views/auth/auth_components/text_field.dart';
import 'package:sinau_studio/views/auth/reset_password_page.dart';
import 'package:sinau_studio/views/auth/sign_up_view.dart';
import 'package:sinau_studio/views/main_view.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    // String message = '';
    bool buttonClicked = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
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
                  "Notula Notes",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Deteksi kefokusan murid",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                TextFieldLogin(
                  controller: emailController,
                  hintText: "Masukan Email",
                  isPassword: false,
                  message: "Masukan email dengan benar",
                  isEmail: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldLogin(
                  controller: passwordController,
                  hintText: "Masukan Password",
                  isPassword: true,
                  message: "Masukan password dengan benar",
                  isEmail: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ResetPasswordPage(),
                              ));
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Lupa Password ?',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomLoginButton(
                  buttonName: "Login",
                  onTap: () async {
                    if (buttonClicked) {
                      final isValidForm = formKey.currentState!.validate();

                      if (isValidForm) {
                        final UserModel dataUser = UserModel(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        final result =
                            await ref.watch(authViewModel).login(dataUser);
                        if (result == 200) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login Successful"),
                              ),
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainView(),
                              ),
                              (route) => false,
                            );
                          }
                        } else if (result == 404) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Email tidak ditemukan"),
                              ),
                            );
                          }
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Password anda salah"),
                              ),
                            );
                          }
                        }
                        // Provider.of<AuthViewModel>(context, listen: false)
                        //     .login(emailController.text,
                        //         passwordController.text, context);
                        // buttonClicked = false;
                        // await Future.delayed(const Duration(seconds: 1));
                        // if (prof.message != null) {
                        //   showAlertDialog(prof.message ?? '');
                        // }
                        // buttonClicked = true;
                      }
                    }
                  },
                ),
                // Visibility(
                //     visible: prof.message != null,
                //     child: Text(prof.message ?? '')),
                // const SizedBox(
                //   height: 30,
                // ),
                // const Text('OR'),
                // const SizedBox(
                //   height: 30,
                // ),
                // GoogleButton(
                //   buttonName: 'Login',
                //   onTap: () {},
                // ),
                // const Spacer(
                //   flex: 2,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpView(),
                        ),
                      ),
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
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
        )),
      ),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(
          message.toString(),
        ),
      ),
    );
  }

  void showAlertDialog(String text, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: Text(text),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            // Consumer<AuthViewModel>(
            //   builder: (context, value, child) {
            //     if (value.message == 'You must verify your email first!') {
            //       return ElevatedButton(
            //         onPressed: () async {
            //           await value.userCredential.user!.sendEmailVerification();
            //           Navigator.pop(context);
            //           print('Send Email');
            //         },
            //         child: const Text('Send'),
            //       );
            //     } else {
            //       return ElevatedButton(
            //         onPressed: () async {},
            //         child: const Text('Yes'),
            //       );
            //     }
            //   },
            //   child: ElevatedButton(
            //     onPressed: () async {},
            //     child: const Text('Yes'),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
