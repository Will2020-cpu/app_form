import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _loginError;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final Map<String, String> users = {
    'wcamacho': 'password',
    'wcamacho2': 'password',
    'wcamacho3': 'password3',
  };

  void login() {
    setState(() {
      _loginError = null;
    });

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final username = _usernameController.text;
    final password = _passwordController.text;

    if (users.containsKey(username) && users[username] == password) {
      context.go('/', extra: username);
      return;
    }
    setState(() {
      _loginError = 'Usuario o contrasena incorrectas';
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio de sesion')),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre de usuario',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre de usuario es obligatorio';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contrasena',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La contrasena es obligatoria';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              if (_loginError != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    _loginError!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              ElevatedButton(
                onPressed: login,
                child: const Text('Iniciar sesion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
