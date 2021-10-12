import 'package:flutter/material.dart';
import 'package:g_books/presentation/screens/sign_in/widgets/form_submit_button.dart';
import 'package:g_books/presentation/screens/sign_in/widgets/sign_in_text_field.dart';

class EmailSignInForm extends StatefulWidget {
  const EmailSignInForm({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return const EmailSignInForm();
  }

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SignInTextField(
          prefixIcon: const Icon(Icons.email),
          labelText: 'Email',
          controller: _emailController,
          errorText: 'Error',
          onChanged: print,
        ),
        const SizedBox(height: 10.0),
        SignInTextField(
          prefixIcon: const Icon(Icons.lock),
          labelText: 'Password',
          controller: _passwordController,
          errorText: 'Error',
          onChanged: print,
        ),
        const SizedBox(height: 20.0),
        const FormSubmitButton(
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
