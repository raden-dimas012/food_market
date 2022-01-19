import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_market/models/models.dart';
import 'package:food_market/services/services.dart';


part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    ApiReturnValue<List<Food>> result = await FoodService.getFoods();

    if (result.value != null) {
      emit(FoodLoaded(result.value!));
    } else {
      emit(FoodLoadingFailed(result.message!));
    }
  }
}
