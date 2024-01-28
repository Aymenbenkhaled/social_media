import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/layout/layout.dart';
import 'package:socialapp/modules/register/cubit/cubit.dart';
import 'package:socialapp/modules/register/cubit/state.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/network/local/cache_helper.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUSerSuccessState) {
            navPushAndFinish(context, const Layout());
          } else if (state is CreateUSerErrorState) {
            CustomFlutterToast(
              context: context,
              text: 'err',
              color: Colors.red,
              icon: Icons.error_outline,
            );
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
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
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Register To Browse Our Hot Offers',
                          style: TextStyle(fontSize: 18, color: Colors.grey
                              //fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          label: 'Name',
                          prefIcon: Icons.person,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Name';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefIcon: Icons.email_outlined,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email Adress';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
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
                          onSubmit: (value) {},
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          label: 'Phone',
                          prefIcon: Icons.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Phone';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        (state is! RegisterLoadingState)
                            ? defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.RegisterUser(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                                text: 'register',
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
