

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/auth/bloc/state/age_display_state.dart';

import '../../../domain/auth/usecase/get_ages_use_case.dart';
import '../../../service_locator.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {

  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {

    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold(
            (message) {
          emit(
              AgesLoadFailure(message: message)
          );
        },
            (data) {
          emit(
              AgesLoaded(ages: data)
          );
        }
    );

  }
}