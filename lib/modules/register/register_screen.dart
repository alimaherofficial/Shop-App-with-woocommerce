import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:the_last3/layout/home_layout/home_layout.dart';
import 'package:the_last3/shared/components/components.dart';
import 'package:the_last3/shared/components/default_btn.dart';
import 'package:the_last3/shared/components/validator.dart';
import 'package:the_last3/styles/colors/colors.dart';
import 'package:the_last3/styles/colors/icon_broken.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  var phoneController = TextEditingController();

  var addressController = TextEditingController();

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    int x = 0;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Register To Enjoy',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                DefaultFormField(
                  controller: nameController,
                  textInputType: TextInputType.name,
                  validator: Validator.validateName,
                  label: 'enter_name',
                  prefixIcon: IconlyBroken.User,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                DefaultFormField(
                  controller: addressController,
                  textInputType: TextInputType.text,
                  validator: Validator.validateAddress,
                  label: 'enter_address',
                  prefixIcon: IconlyBroken.Location,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                DefaultFormField(
                  controller: phoneController,
                  textInputType: TextInputType.phone,
                  validator: Validator.validatePhone,
                  label: 'enter_phone',
                  prefixIcon: IconlyBroken.Call,
                  isClickable: true,
                  // cubit.phoneLoginPhoneNum == '' ? true : false,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                DefaultFormField(
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    validator:
                        //  cubit.phoneLoginPhoneNum == ''
                        //     ? Validator.validateEmail
                        //     :
                        Validator.validateEmailCorrect,
                    label:
                        // cubit.phoneLoginPhoneNum == ''
                        //     ? 'enter_email',
                        //     :
                        'enter_email_optional',
                    prefixIcon: IconlyBroken.Message,
                    isClickable:
                        true // cubit.googleLLoginEmail == '' ? true : false,
                    ),
                const SizedBox(
                  height: 15.0,
                ),
                // (cubit.phoneLoginPhoneNum == '' && cubit.googleLLoginEmail == '')
                //   ?
                DefaultFormField(
                    controller: passController,
                    textInputType: TextInputType.visiblePassword,
                    isPassword: isPressed ? false : true,
                    onSubmit: (value) {},
                    validator: Validator.validatePassword,
                    label: 'password',
                    prefixIcon: IconlyBroken.Password,
                    suffixIcon: isPressed
                        ? Icons.remove_red_eye
                        : Icons
                            .visibility_off_sharp, // AuthCubit.get(context).suffix,
                    suffixIconPressed: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    }),
                // : Container(),
                const SizedBox(
                  height: 28.0,
                ),
                Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      x == x, // state is! RegisterLoadingState,
                  widgetBuilder: (BuildContext context) => DefaultButtonView(
                      background: defaultColor,
                      function: () {
                         Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Homelayout(),
                                      ));
                        // if (formKey.currentState!.validate()) {
                        //   if (cubit.phoneLoginPhoneNum == '' && cubit.googleLLoginEmail == '') {
                        //     //normalRegister
                        //     AuthCubit.get(context).userRegister(
                        //       email: emailController.text,
                        //       password: passController.text,
                        //       name: nameController.text,
                        //       address: addressController.text,
                        //       phone: phoneController.text,
                        //     );
                        //   } else {
                        //     //phone or google Register
                        //     AuthCubit.get(context).userCreate(
                        //       email: emailController.text,
                        //       name: nameController.text,
                        //       address: addressController.text,
                        //       phone: phoneController.text,
                        //       uId: cubit.phoneOrEmailUid,
                        //     );
                        //   }
                        // }
                      },
                      text: 'register',
                      isUpperCase: true,
                      radius: 5.0),
                  fallbackBuilder: (BuildContext context) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
