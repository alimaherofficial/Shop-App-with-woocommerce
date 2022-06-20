import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:the_last3/cubit/home/home_cubit.dart';
import 'package:the_last3/cubit/home/home_states.dart';
import 'package:the_last3/modules/error_screen/error_screen.dart';
import 'package:the_last3/modules/login/login_screen.dart';
import 'package:the_last3/modules/register/register_screen.dart';
import 'package:the_last3/shared/components/components.dart';
import 'package:the_last3/styles/colors/colors.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeStates>(
      listener: (context, state) {},
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit().get(context);
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) =>
                cubit.allproduct != null,
            widgetBuilder: (BuildContext context) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Categories',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0)),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                          child: const Text(
                            'SeeAll00',
                            style: TextStyle(
                                color: defaultColor,
                                decoration: TextDecoration.underline,
                                fontSize: 13.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const PicSliderbilder(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Offers',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0)),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ));
                            // for (var i = 0;
                            //     i < cubit.allproduct!.products.length;
                            //     i++) {
                            //   print(cubit.allproduct!.products[i].categories!
                            //       .categories![0].name!
                            //       .endsWith('Premium Organic Tea'));
                            // }

                            // cubit.navigateToCategoryList();
                          },
                          child: const Text(
                            'SeeAll',
                            style: TextStyle(
                                color: defaultColor,
                                decoration: TextDecoration.underline,
                                fontSize: 13.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                      cubit.allproduct!.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return productBuilde(
                          cubit.allproduct!.products[index],
                          index,
                          context,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            fallbackBuilder: (BuildContext context) =>
                state is ProductErrorState
                    ? const ErrorScreen()
                    : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
