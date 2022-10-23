part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}
class GetPositionState extends MainState {}
class UpdatePositionState extends MainState {}
class GetPositionLoadingState extends MainState {}
class GetPositionSuccessState extends MainState {}
class GetPositionErrorState extends MainState {}