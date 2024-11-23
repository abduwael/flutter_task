abstract class SocialAppRegisterStates {}

class SocialAppRegisterInitialStates extends SocialAppRegisterStates {}

class SocialAppRegisterSuccessStates extends SocialAppRegisterStates {}

class SocialAppRegisterErrorStates extends SocialAppRegisterStates {
  late final String error;

  SocialAppRegisterErrorStates(this.error);
}

class SocialAppRegisterLoadingStates extends SocialAppRegisterStates {}

class SocialAppRegisterChangeVisibility extends SocialAppRegisterStates {}
