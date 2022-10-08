part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();
  factory HomeState({
    @Default([]) List<AuthorModel> results,
    @Default(Status.initial) Status status,
    @Default('') String? errorMessage,
  }) = _HomeState;
}
