import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'email_sign_in_state.dart';

class EmailSignInCubit extends Cubit<EmailSignInState> {
  EmailSignInCubit() : super(EmailSignInInitial());
}
