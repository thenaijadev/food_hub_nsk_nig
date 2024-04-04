import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:the_food_hub_nsk_nig/core/errors/user_error.dart';
import 'package:the_food_hub_nsk_nig/core/utils/typedef.dart';
import 'package:the_food_hub_nsk_nig/features/users/data/users/user_model.dart';

class UsersProvider {
  UsersProvider({required this.db});
  final FirebaseFirestore db;
  EitherUserModelOrUserError createUser(UserModel user) {
    try {
      db.collection("users").doc(user.id).set(user.toMap());
      return right(user);
    } catch (e) {
      return left(UserError(message: e.toString()));
    }
  }

  Future<EitherBoolOrUserError> deleteUser(String userId) async {
    try {
      await db.collection("users").doc(userId).delete();
      return right(true);
    } catch (e) {
      return left(UserError(message: e.toString()));
    }
  }

  Future<EitherBoolOrUserError> updateUser(
      {required Map<String, dynamic> userDetails}) async {
    try {
      final messageRef = db.collection("users").doc(userDetails["id"]);
      await messageRef.update(userDetails);
      return right(true);
    } catch (e) {
      return left(UserError(message: e.toString()));
    }
  }
}
