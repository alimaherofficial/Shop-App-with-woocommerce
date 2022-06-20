import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_last3/cubit/app_cubit/stastes.dart';
import 'package:the_last3/modules/cart_sccreen/cart_screen.dart';
import 'package:the_last3/modules/categories_screen/categories_screen.dart';
import 'package:the_last3/modules/favourites_screen/favourites_screen.dart';
import 'package:the_last3/modules/home_screen/home_screen.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreen = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavouritesScreen(),
    const CartScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(AppChangeBottomState());
  }
}
