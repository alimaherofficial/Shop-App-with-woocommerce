// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_last3/cubit/home/home_states.dart';
import 'package:the_last3/models/all_products_model/all_products.dart';
import 'package:the_last3/network/local/cofig.dart';
import 'package:the_last3/network/remote/dio_helper/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  HomeCubit get(context) => BlocProvider.of(context);

  // int currentIndicator = 0;
  // void homeSliderIndicator(int newIndex) {
  //   currentIndicator = newIndex;
  //   emit(SliderIndicatorChange());
  // }

  AllProductModdel? allproduct;
  void getproduct() {
    emit(ProductLodingState());
    DioHelper.getData(
      path: 'wp-json/wc/v3/products?',
      query: {
        'per_page': 100,
        'consumer_key': Config.Consumerkey,
        'consumer_secret': Config.Consumersecret,
      },
    ).then((value) {
      allproduct = AllProductModdel.fromJson(value.data);
      emit(ProductSuccessState());
      print(value.data.toString());
    }).catchError((error) {
      emit(ProductErrorState(error.toString()));
      print(error.toString());
    });
  }
}
