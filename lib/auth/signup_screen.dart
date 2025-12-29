import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lab1/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

    try {
      final account = await googleSignIn.signIn();
      if (account == null) return;

      if (!context.mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (Route<dynamic> route) => false,
      );
    } catch (e, st) {
      debugPrint('Google sign in error: $e');
      debugPrint('$st');

      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Google sign in failed: $e')));
    }
  }

  Future<void> _signUpWithEmailPassword() async {
    final fullName = _fullNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }
    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create account'),
        backgroundColor: const Color(0xFF1877F2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Join Facebook',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                hintText: 'Full name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 12),

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

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'New password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1877F2),
                ),
                onPressed: _signUpWithEmailPassword,
                child: const Text('Sign Up', style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 16),

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
            const SizedBox(height: 12),

            SizedBox(
              height: 48,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.grey),
                ),
                onPressed: () => _signInWithGoogle(context),
                icon: const Icon(
                  Icons.g_mobiledata,
                  color: Colors.red,
                  size: 28,
                ),
                label: const Text(
                  'Sign up with Google',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 24),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Already have an account? Log in'),
            ),
          ],
        ),
      ),
    );
  }
}
