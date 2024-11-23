import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/controller/auth_cubit/sign_up/sign_up_states.dart';

import '../../../core/utils/shared_prefrence_helper.dart';
import '../../../models/user_model.dart';

class SocialRegisterCubit extends Cubit<SocialAppRegisterStates> {
  SocialRegisterCubit(super.initialState);

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  // Register a new user
  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SocialAppRegisterLoadingStates());

    try {
      // Check if the email already exists
      if (SharedPrefHelper.userExists(email)) {
        emit(SocialAppRegisterErrorStates("Email already exists"));
        return;
      }

      // Create the new user
      final newUser = UserModel(name: name, email: email, password: password);

      // Add the user to SharedPreferences
      await SharedPrefHelper.addUser(newUser);

      emit(SocialAppRegisterSuccessStates());
    } catch (error) {
      emit(SocialAppRegisterErrorStates(error.toString()));
    }
  }

  // Retrieve all users (for testing or admin purposes)
  List<UserModel> getUsers() {
    return SharedPrefHelper.getUsers();
  }
}
