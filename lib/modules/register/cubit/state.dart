abstract class RegisterStates {}

class CreateUSerSuccessState extends RegisterStates {}
class CreateUSerErrorState extends RegisterStates {}
class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  // final RegisterModel registerModel;
  // RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterStates {
  String? error;
  RegisterErrorState(this.error);
}

class RegisterChangeVisibilityPasswordState extends RegisterStates {}
