// ignore_for_file: must_be_immutable, avoid_print, unused_local_variable


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:the_last3/cubit/login/one_product_cubit/login_cubit.dart';
import 'package:the_last3/cubit/login/one_product_cubit/login_ststes.dart';
import 'package:the_last3/layout/home_layout/home_layout.dart';
import 'package:the_last3/modules/register/register_screen.dart';
import 'package:the_last3/shared/components/components.dart';
import 'package:the_last3/shared/components/default_btn.dart';
import 'package:the_last3/shared/components/default_txt_btn.dart';
import 'package:the_last3/shared/components/validator.dart';
import 'package:the_last3/styles/colors/colors.dart';
import 'package:the_last3/styles/colors/icon_broken.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passController = TextEditingController();

  final phoneAuthFormKey = GlobalKey<FormState>();

  final phoneAuthController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    int x = 0;

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit().get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            actions: [
              Center(
                child: InkWell(
                  onTap: () {
                    // cubit.changeLang(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Arabic',
                      style: TextStyle(color: defaultColor,),
                    ),
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                    color: Colors.white,
                    child: Image.asset(
                      'assets/images/graudupes-New-Logo-1.png',
                      height: 200.0,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                  padding: const EdgeInsets.all(14.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      )),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Welcome to Graudupes',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Homelayout(),
                                      ));
                                },
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(color: defaultColor),
                                )),
                          ],
                        ),
                        //    state is GoogleSingUpLoading ?  defaultLinearProgressIndicator(): Container(),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultFormField(
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: Validator.validateEmail,
                          label: 'Enter Email',
                          prefixIcon: IconlyBroken.Message,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        DefaultFormField(
                            controller: passController,
                            textInputType: TextInputType.visiblePassword,
                            isPassword: isPressed ? false : true,
                            onSubmit: (value) {
                              // if (formKey.currentState!.validate()) {
                              //   cubit.uerLogin(
                              //     email: emailController.text,
                              //     password: passController.text,
                              //   );
                              // }
                            },
                            validator: Validator.validatePassword,
                            label: 'Password',
                            prefixIcon: IconlyBroken.Password,
                            suffixIcon: isPressed
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_sharp,
                            suffixIconPressed: () {
                              setState(() => isPressed = !isPressed);
                            }),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) => x == x,
                          //  state is! LoginLoadingState,
                          widgetBuilder: (BuildContext context) =>
                              DefaultButtonView(
                                  function: () {
                                     Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Homelayout(),
                                      ));
                                    print(emailController.text);
                                    print(passController.text);
                                    // if (formKey.currentState!.validate()) {
                                    //   cubit.uerLogin(
                                    //     email: emailController.text,
                                    //     password: passController.text,
                                    //   );
                                    // }
                                  },
                                  text: 'LOGIN',
                                  isUpperCase: true,
                                  background: defaultColor,
                                  radius: 5.0),
                          fallbackBuilder: (BuildContext context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'dont_have_account',
                            ),
                            DefaultTextButtonView(
                              textStyle: const TextStyle(fontSize: 15.0),
                              text: 'register',
                              function: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const RegisterScreen(),
                                    ));
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        // const Align(
                        //   child: Text(
                        //       ' ـــــــــــــــ${'or_ling_by'}ـــــــــــــــ '),
                        //   alignment: Alignment.center,
                        // ),
                        // const SizedBox(
                        //   height: 10.0,
                        // ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: ElevatedButtonIconView(
                        //         elevation: 0.5,
                        //         bgColor: Colors.white,
                        //         textColor: Colors.black,
                        //         icon: const Icon(
                        //           IconlyBroken.Call,
                        //           color: defaultColor,
                        //         ),
                        //         text: 'sing_in_by_phone',
                        //         function: () {},
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: ElevatedButtonIconView(
                        //         elevation: 0.5,
                        //         bgColor: Colors.white,
                        //         textColor: Colors.black,
                        //         text: 'google_sing_in',
                        //         function: () {},
                        //         icon: googleIcon,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(8.0),
                //   height: MediaQuery.of(context).size.height / 1.9,
                //   decoration: BoxDecoration(
                //       color: const Color(0x00737373),
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Container(
                //     decoration: const BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(15.0),
                //             topRight: Radius.circular(15.0))),
                //     child: Form(
                //       key: phoneAuthFormKey,
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Center(
                //               child: Container(
                //                 width: 60.0,
                //                 height: 2.5,
                //                 color: Colors.grey,
                //               ),
                //             ),
                //             const SizedBox(
                //               height: 12.0,
                //             ),
                //             DefaultFormField(
                //               controller: phoneAuthController,
                //               textInputType: TextInputType.phone,
                //               hint: '01*********',
                //               validator: (String? value) {
                //                 if (value!.isEmpty || value.length < 9) {
                //                   return 'enterPhoneVer';
                //                 }
                //                 return null;
                //               },
                //               label: 'enter_txt',
                //               prefixIcon: IconlyBroken.Call,
                //             ),
                //             const SizedBox(
                //               height: 15.0,
                //             ),
                //             Conditional.single(
                //               conditionBuilder: (context) => x == x,
                //               context: context,
                //               widgetBuilder: (BuildContext context) {
                //                 return Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: DefaultButtonView(
                //                     radius: 10.0,
                //                     text: 'LOGIN_txt',
                //                     background: defaultColor,
                //                     function: () {
                //                       // if (phoneAuthFormKey.currentState!.validate()) {
                //                       //   print('LoginPressed ${'enter_sms');
                //                       //   cubit.phoneAuth('+2${phoneAuthController.text}',context,'enter_sms',);
                //                       // }
                //                     },
                //                   ),
                //                 );
                //               },
                //               fallbackBuilder: (context) =>
                //                   const CircularProgressIndicator(),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
