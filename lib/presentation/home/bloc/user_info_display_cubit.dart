import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/home/bloc/user_info_display_state.dart';

import '../../../domain/auth/usecase/get_user_use_case.dart';
import '../../../service_locator.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUseCase>().call();
    returnedData.fold((error) {
      emit(LoadUserInfoFailure());
    }, (data) {
      emit(UserInfoLoaded(user: data));
    });
  }
}
