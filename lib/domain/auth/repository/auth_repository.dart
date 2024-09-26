import 'package:dartz/dartz.dart';
import 'package:shop_app/data/auth/models/user_creation_req.dart';
import 'package:shop_app/data/auth/models/user_signin_req.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signIn(UserSigninReq user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}
