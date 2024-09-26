import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/data/auth/models/user_creation_req.dart';
import 'package:shop_app/data/auth/models/user_signin_req.dart';
import 'package:shop_app/data/auth/source/auth_firebase_service.dart';
import 'package:shop_app/domain/auth/repository/auth_repository.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signUp(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<Either> signIn(UserSigninReq user) async {
    return await sl<AuthFirebaseService>().signIn(user);
  }
}
