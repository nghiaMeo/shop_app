import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/data/auth/models/user_creation_req.dart';

import '../../../service_locator.dart';
import '../repository/auth_repository.dart';

class SignupUsecase implements UseCase<Either,UserCreationReq>{
  @override
  Future<Either> call({UserCreationReq? params}) async {

    return  await sl<AuthRepository>().signup(params!);
  }
  
}