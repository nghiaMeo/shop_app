import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/splash/bloc/splash_event.dart';
import 'package:shop_app/presentation/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(DisplaySplash()) {
    _onAppStarted();
  }

  void _onAppStarted() {
    on<AppStarted>((event, emit) async {
      await Future.delayed(
        Duration(seconds: 2),
      );
      emit(UnAuthenticated());
    });
  }
}
