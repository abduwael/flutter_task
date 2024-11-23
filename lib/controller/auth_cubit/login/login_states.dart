abstract class SocialAppLoginStates {}

class SocialAppLoginInitialState extends SocialAppLoginStates {}

class SocialAppLoginSuccessStates extends SocialAppLoginStates {}

class SocialAppLoginLoadingStates extends SocialAppLoginStates {}

class SocialAppLoginEmptyStates extends SocialAppLoginStates {}

class SocialAppLoginErrorStates extends SocialAppLoginStates {
  final String error;
  SocialAppLoginErrorStates(this.error);
}

class SocialAppLoginChangeVisibility extends SocialAppLoginStates {}
