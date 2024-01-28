import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialapp/layout/layout.dart';
import 'package:socialapp/modules/login/cubit/cubit.dart';
import 'package:socialapp/modules/login/cubit/state.dart';
import 'package:socialapp/modules/register/register_screen.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navPushAndFinish(context, const Layout());
            });
          } else if (state is LoginErrorState) {
            CustomFlutterToast(
                context: context,
                text: '${state.error}',
                color: Colors.red,
                icon: Icons.approval,
                gravity: ToastGravity.TOP);
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Login To Browse Our Hot Offers',
                          style: TextStyle(fontSize: 18, color: Colors.grey
                              //fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefIcon: Icons.email_outlined,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email Address';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          prefIcon: Icons.password,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                          },
                          obscureText: cubit.obscure,
                          suffIcon: cubit.icon,
                          suffpressd: () {
                            cubit.ChangeVisibility();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              cubit.LoginUser(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        (state is! LoginLoadingState)
                            ? defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.LoginUser(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'login',
                                width: double.infinity,
                                radius: 0,
                                isUpperCase: true,
                                color: Colors.white,
                                context: context,
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t Have An Account ? '),
                            defaultTexButton(
                                function: () {
                                  navPush(context, RegisterScreen());
                                },
                                text: 'REGISTER'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
