import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/data/auth/models/user_creation_req.dart';
import 'package:shop_app/data/auth/models/user_signin_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserCreationReq user);

  Future<Either> signIn(UserSigninReq user);

  Future<Either> getAges();

  Future<Either> sendPasswordResetEmail(String email);

  Future<bool> isLoggedIn();

  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signUp(UserCreationReq user) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(data.user!.uid)
          .set(
        {
          'userId': user.userId,
          'firstName': user.firstName,
          'lastName': user.lastName,
          'email': user.email,
          'gender': user.gender,
          'age': user.age
        },
      );

      return Right("Sign up was successfully");
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();
      return Right(returnedData.docs);
    } catch (e) {
      return left("Please try again");
    }
  }

  @override
  Future<Either> signIn(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);

      return Right("Sign in was successfully");
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return const Right('Password reset email is sent');
    } catch (e) {
      if (email.isEmpty) {
        return const Left("Email can't be empty");
      }
      return const Left('Please try again!');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance.collection('Users').doc(
          currentUser?.uid
      ).get().then((value) => value.data());
      return Right(
          userData
      );
    } catch(e) {
      return const Left(
          'Please try again'
      );
    }
  }

}
