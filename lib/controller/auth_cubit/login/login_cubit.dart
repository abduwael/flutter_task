import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/shared_prefrence_helper.dart';
import '../../../models/user_model.dart';
import 'login_states.dart';

class SocialLoginCubit extends Cubit<SocialAppLoginStates> {
  SocialLoginCubit() : super(SocialAppLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(SocialAppLoginLoadingStates());

    try {
      // Check if the email exists in the database
      if (!SharedPrefHelper.userExists(email)) {
        emit(SocialAppLoginErrorStates("Email does not exist"));
        return;
      }

      // Retrieve all users
      final users = SharedPrefHelper.getUsers();

      final user = users.firstWhere(
        (user) => user.email == email,
        orElse: () {
          throw Exception("User not found");
        },
      );

      // Validate password
      if (user.password != password) {
        emit(SocialAppLoginErrorStates("Incorrect password"));
        return;
      }

      // Save the current user to SharedPreferences
      await SharedPrefHelper.saveData(
        key: 'current_user',
        value: user.toJson(),
      );

      // Emit success state
      emit(SocialAppLoginSuccessStates());
    } catch (error) {
      emit(SocialAppLoginErrorStates(error.toString()));
    }
  }
}
