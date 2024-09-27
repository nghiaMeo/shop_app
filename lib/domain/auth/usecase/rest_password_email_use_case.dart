import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';

import 'package:shop_app/domain/auth/repository/auth_repository.dart';

import '../../../service_locator.dart';

class RestPasswordEmailUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({required String? params}) {
    return sl<AuthRepository>().sendPasswordResetEmail(params!);
  }
}
