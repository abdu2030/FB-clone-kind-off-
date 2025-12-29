import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'package:lab1/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

    try {
      
      await googleSignIn.signOut();
      // Alternatively: await googleSignIn.disconnect();

      final account = await googleSignIn.signIn();

      if (account == null) {
        // User cancelled
        return;
      }

      if (!context.mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (Route<dynamic> route) => false, // remove all previous routes
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Google sign in failed: $e')));
    }
  }

  Future<void> _loginWithEmailPassword() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
      (Route<dynamic> route) => false, // remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'facebook',
              style: TextStyle(
                color: Color(0xFF1877F2),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // Email / phone
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email or phone',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Password
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Normal login button (email/password)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1877F2),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _loginWithEmailPassword,
                child: const Text('Log In', style: TextStyle(fontSize: 16)),
              ),
            ),

            TextButton(onPressed: () {}, child: const Text('Forgot password?')),

            const SizedBox(height: 8),

            // OR separator
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('OR'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 8),

            // Google login button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: Colors.grey.shade300),
                  backgroundColor: Colors.white,
                ),
                onPressed: () => _signInWithGoogle(context),
                icon: const Icon(
                  Icons.g_mobiledata,
                  color: Colors.red,
                  size: 28,
                ),
                label: const Text(
                  'Continue with Google',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Divider(),

            // Create account button
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignupScreen()),
                );
              },
              child: const Text('Create new account'),
            ),
          ],
        ),
      ),
    );
  }
}
