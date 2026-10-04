import 'package:flutter/material.dart';
import 'package:workshop_flutter__4ei3/GStore.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _signInKey = GlobalKey<FormState>();
  final _signUpKey = GlobalKey<FormState>();
  bool _isSignUp = false;

  void _openStore() {
    final formKey = _isSignUp ? _signUpKey : _signInKey;
    if (!formKey.currentState!.validate()) {
      return;
    }

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const GStore()));
  }

  void _showSignUp() {
    setState(() {
      _isSignUp = true;
    });
  }

  void _showSignIn() {
    setState(() {
      _isSignUp = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FD),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 22),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                child: _isSignUp
                    ? _AuthForm.signUp(
                        key: const ValueKey('sign-up'),
                        formKey: _signUpKey,
                        onSubmit: _openStore,
                        onToggle: _showSignIn,
                      )
                    : _AuthForm.signIn(
                        key: const ValueKey('sign-in'),
                        formKey: _signInKey,
                        onSubmit: _openStore,
                        onToggle: _showSignUp,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthForm extends StatelessWidget {
  const _AuthForm.signIn({
    super.key,
    required this.formKey,
    required this.onSubmit,
    required this.onToggle,
  }) : title = 'Sign In',
       primaryButton = 'SIGN IN',
       linkText = 'Forgot password?',
       showUsername = false,
       showSecondaryButton = true;

  const _AuthForm.signUp({
    super.key,
    required this.formKey,
    required this.onSubmit,
    required this.onToggle,
  }) : title = 'Sign Up',
       primaryButton = 'SIGN UP',
       linkText = 'Already have an account ?',
       showUsername = true,
       showSecondaryButton = false;

  final GlobalKey<FormState> formKey;
  final VoidCallback onSubmit;
  final VoidCallback onToggle;
  final String title;
  final String primaryButton;
  final String linkText;
  final bool showUsername;
  final bool showSecondaryButton;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        key: ValueKey(title),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 28),
          const Icon(Icons.movie_creation, color: Color(0xFF3A3A3A), size: 104),
          const SizedBox(height: 46),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF2E2C33),
              fontSize: 23,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          if (showUsername) ...[
            const _AuthTextField(hintText: 'username'),
            const SizedBox(height: 16),
          ],
          const _AuthTextField(
            hintText: 'email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          const _AuthTextField(hintText: 'password', obscureText: true),
          const SizedBox(height: 18),
          if (showSecondaryButton)
            _RoundedButton(
              text: primaryButton,
              color: const Color(0xFFFF6A3D),
              onPressed: onSubmit,
            )
          else
            _ArrowLink(text: linkText, onPressed: onToggle),
          if (showSecondaryButton) ...[
            const SizedBox(height: 12),
            _RoundedButton(
              text: 'CREATE AN ACCOUNT',
              color: const Color(0xFFFF403A),
              onPressed: onToggle,
            ),
          ],
          const SizedBox(height: 16),
          if (showSecondaryButton)
            _ArrowLink(text: linkText, onPressed: () {})
          else
            _RoundedButton(
              text: primaryButton,
              color: const Color(0xFFFF6A3D),
              onPressed: onSubmit,
            ),
        ],
      ),
    );
  }
}

class _AuthTextField extends StatelessWidget {
  const _AuthTextField({
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: obscureText
            ? TextInputAction.done
            : TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFC9BFC8),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFBEB4BD), width: 1.5),
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF6A3D), width: 1.5),
            borderRadius: BorderRadius.zero,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF403A), width: 1.5),
            borderRadius: BorderRadius.zero,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF403A), width: 1.5),
            borderRadius: BorderRadius.zero,
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Required field';
          }
          return null;
        },
      ),
    );
  }
}

class _RoundedButton extends StatelessWidget {
  const _RoundedButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  final String text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
        ),
        child: Text(text),
      ),
    );
  }
}

class _ArrowLink extends StatelessWidget {
  const _ArrowLink({required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: onPressed,
        iconAlignment: IconAlignment.end,
        label: Text(text),
        icon: const Icon(Icons.arrow_forward, size: 17),
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFFF6A3D),
          textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
