part of 'email_sign_in_cubit.dart';

@immutable
abstract class EmailSignInState {}

enum EmailSignInFormType { signIn, register }

class EmailSignInInitial extends EmailSignInState {
  EmailSignInInitial({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.formType = EmailSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
    // required this.auth,
    // required this.database,
  });

  String email;
  String password;
  String confirmPassword;
  EmailSignInFormType formType;
  bool isLoading;
  bool submitted;
  // final AuthBase auth;
  // final Database database;
}
