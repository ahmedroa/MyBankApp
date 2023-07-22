part of 'cubit.dart';

@immutable
abstract class AppBankState {}

class AppBankInitial extends AppBankState {}

class AppBankCheanModeState extends AppBankState {}

class GetDataUserLodingState extends AppBankState {}

class GetDataUserSussesState extends AppBankState {}

class GetDataUserErrorgState extends AppBankState {}

class Loading extends AppBankState {}

class LoginSuccessful extends AppBankState {}

class LogoutFailed extends AppBankState {}

class LogoutSuccessful extends AppBankState {}

class ErrorOccurred extends AppBankState {
  final String errorMsg;

  ErrorOccurred({required this.errorMsg});
}

class PhoneNumberSubmited extends AppBankState {}

class phoneSusd extends AppBankState {}

class PhoneOTPVerified extends AppBankState {}
