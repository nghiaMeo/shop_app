import 'package:get_it/get_it.dart';
import 'package:shop_app/data/auth/repository/auth_repository_impl.dart';
import 'package:shop_app/data/auth/source/auth_firebase_service.dart';
import 'package:shop_app/domain/auth/repository/auth_repository.dart';
import 'package:shop_app/domain/usecase/rest_password_email_use_case.dart';

import 'domain/usecase/get_ages.dart';
import 'domain/usecase/signin_use_case.dart';
import 'domain/usecase/signup_use_case.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUsecase>(SignupUsecase());

  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<RestPasswordEmailUseCase>(RestPasswordEmailUseCase());
}
