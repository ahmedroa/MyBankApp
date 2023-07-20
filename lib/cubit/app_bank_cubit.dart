import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_bank_state.dart';

class AppBankCubit extends Cubit<AppBankState> {
  AppBankCubit() : super(AppBankInitial());
  static AppBankCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  changeAppMode() {
    isDark = !isDark;
    emit(AppBankCheanModeState());
  }
}
