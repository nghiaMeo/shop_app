import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/data/auth/models/user_signin_req.dart';
import 'package:shop_app/domain/auth/repository/auth_repository.dart';

import '../../../service_locator.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({required UserSigninReq? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
