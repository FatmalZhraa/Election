import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../dio/dio_helper.dart';
import '../../dio/end_points.dart';
import '../../shared_preference/cache_helper.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  List<String> position = [
    "President",
    "Cairo Coordinator",
    "Vice Cairo Coordinator",
    "Helwan Coordinator",
    "Vice Helwan Coordinator",
    "Other Coordinator",
        "Head",
    "Vice Head",];
  int selectedposition=0;
  void position_name(int index){
    selectedposition=index;
    emit(GetPositionState());
  }
  void getPosition(String positionName) {
    emit(GetPositionState());
    DioHelper.postData(
            url: VOTE,
            data: {"position_name": positionName},
            token: CacheHelper.getData(key: "token"))
        .then((value) {
      print(value.data);
      emit(GetPositionSuccessState());
    }).catchError((error) {
      emit(GetPositionErrorState());
    });
  }
}