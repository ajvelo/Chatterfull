import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Login')),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Create new account',
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
