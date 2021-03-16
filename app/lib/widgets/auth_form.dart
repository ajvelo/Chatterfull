import 'package:flutter/material.dart';
import 'package:app/helpers/string_ext.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key? key,
    required this.submitFn,
  }) : super(key: key);

  final void Function(
      String email, String password, String username, bool isLogin) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if (isValid != null && isValid) {
      _formKey.currentState?.save();
      widget.submitFn(_userEmail, _userPassword, _userName, _isLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    onSaved: (newValue) {
                      _userEmail = newValue!;
                    },
                    validator: (value) {
                      if (value != null && !value.isValidEmail()) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                    ),
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      onSaved: (newValue) {
                        _userName = newValue!;
                      },
                      validator: (value) {
                        if (value != null && value.length < 4) {
                          return 'Username must be at least 4 characters long';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    onSaved: (newValue) {
                      _userPassword = newValue!;
                    },
                    validator: (value) {
                      if (value != null && value.length < 7) {
                        return 'Password must be at least 7 characters long';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _trySubmit();
                      },
                      child: Text(_isLogin ? 'Login' : 'Signup')),
                  TextButton(
                      onPressed: () {
                        setState(() {});
                        _isLogin = !_isLogin;
                      },
                      child: Text(
                        _isLogin
                            ? 'Create a new account'
                            : 'I already have an account',
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
