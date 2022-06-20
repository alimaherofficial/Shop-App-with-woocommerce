import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_last3/cubit/app_cubit/cubit.dart';
import 'package:the_last3/cubit/app_cubit/stastes.dart';
import 'package:the_last3/cubit/home/home_cubit.dart';
import 'package:the_last3/cubit/home/home_states.dart';
import 'package:the_last3/cubit/login/one_product_cubit/login_cubit.dart';
import 'package:the_last3/cubit/login/one_product_cubit/login_ststes.dart';
import 'package:the_last3/cubit/one_product_cubit/one_product_cubit.dart';
import 'package:the_last3/cubit/one_product_cubit/one_product_ststes.dart';
import 'package:the_last3/modules/on_boarding_screen%20copy/on_boarding_screen.dart';
import 'package:the_last3/network/remote/dio_helper/dio_helper.dart';
import 'package:the_last3/styles/colors/colors.dart';

import 'cubit/bloc_observer.dart';

void main() async {
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
    //eventTransformer: customEventTransformer(),
  );

  await DioHelper.init();
   BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData lightTheme = ThemeData(
      buttonTheme: const ButtonThemeData(
        buttonColor: defaultColor,
        textTheme: ButtonTextTheme.primary,
      ),
      primarySwatch: defaultColor,
      scaffoldBackgroundColor: MyColors.scaffoldBackgroundColorMain,
      canvasColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'EnFont',
        ),
        titleSpacing: 19.0,
        // ignore: deprecated_member_use
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MyColors.scaffoldBackgroundColorMain,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: MyColors.scaffoldBackgroundColorMain,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: defaultColor,
          unselectedItemColor: Colors.grey,
          elevation: 20.0,
          backgroundColor: Colors.white),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontFamily: 'EnFont',
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        subtitle1: TextStyle(
          fontFamily: 'EnFont',
          fontSize: 13.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          height: 1.3,
        ),
      ),
      fontFamily: 'EnFont',
    );
    

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getproduct(),
          // ..getproduct()
        ),
        BlocProvider(
          create: (context) => OneProductCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AppCubit, AppStates>(
            listener: (context, state) {},
          ),
          BlocListener<HomeCubit, HomeStates>(
            listener: (context, state) {},
          ),
          BlocListener<OneProductCubit, OneProductStates>(
            listener: (context, state) {},
          ),
          BlocListener<LoginCubit, LoginStates>(
            listener: (context, state) {},
          ),
        ],
        child: MaterialApp(
          title: 'Graudupes',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: const OnBoardingScreen(),
        ),
      ),
    );
  }
}
