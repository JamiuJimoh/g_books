import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'email_sign_in_event.dart';
part 'email_sign_in_state.dart';

class EmailSignInBloc extends Bloc<EmailSignInEvent, EmailSignInState> {
  EmailSignInBloc() : super(EmailSignInInitial()) {
    on<EmailSignInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
