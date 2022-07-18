import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_page_state.dart';

class OrderPageCubit extends Cubit<OrderPageState> {
  OrderPageCubit() : super(OrderPageState(hintText: ''));

  void changeHintText(String hintText, String dropDownValue) {
    hintText = dropDownValue;
    emit(state.copyWith(hintText: hintText));
  }

  void changeValue(String value) {
    emit(state.copyWith(liquid: value));
  }

  void changeValue2(String value){
    emit(state.copyWith(weight: value));
  }
}
