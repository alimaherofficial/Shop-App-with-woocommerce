abstract class HomeStates{}

class HomeInitialState extends HomeStates{}


class SliderIndicatorChange extends HomeStates{}


class ProductLodingState extends HomeStates{}

class ProductSuccessState extends HomeStates{}

class ProductErrorState extends HomeStates{
  final String error;
  ProductErrorState(this.error);
}