// ignore: unnecessary_import
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'one_product_ststes.dart';

class OneProductCubit extends Cubit<OneProductStates> {
  OneProductCubit() : super(OneInitialState());

  OneProductCubit get(context) => BlocProvider.of(context);
  int number = 1;
  int cartnumber = 0;

  void add() {
    number++;
    emit(AddNumberState());
  }

  void minus() {
    if (number < 1) {
      number = 0;
    }
    if (number > 1) {
      number--;
    }
    emit(MinusNumberState());
  }

  void cartadd() {
    cartnumber++;
    emit(AddToCartberState());
  }


  int x = 0;
  void changex(int y) {
    x = y;
    emit(ChangeToggleState());
  }
}
