import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../Models/user.dart';
import '../../dio/dio_helper.dart';
import '../../dio/end_points.dart';
import '../../shared_preference/cache_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  void login(User user) {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: user.toJson()).then((value) {
      print(value.data);
      //CacheHelper.saveData(key: "token", value: value);
      CacheHelper.saveData(key: "userName", value: value);
      emit(LoginSuccessfulState());
    }).catchError((error) {
      debugPrint("Login error is: $error");
      emit(LoginErrorState());
    });
  }
}