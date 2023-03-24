import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:termomete/services/email/email_signup.dart';

class FormWidget extends StatefulWidget {
  final bool isLogin;
  // final Size md;
  FormWidget({
    super.key,
    required this.isLogin,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _key = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  TextEditingController _pass = TextEditingController();
  TextEditingController _conPass = TextEditingController();
  bool _isLoading = false;

  void _trySubmit() {
    final _isValid = _key.currentState!.validate();

    if (_isValid) {
      _key.currentState!.save();
      try {
        setState(() {
          _isLoading = true;
        });
        if (widget.isLogin) {
          Provider.of<EmailSignUp>(context, listen: false)
              .emailSignIn(email: _email.trim(), password: _password.trim());
        } else {
          Provider.of<EmailSignUp>(context, listen: false)
              .emailSignUp(email: _email.trim(), password: _password.trim());
        }
      } on PlatformException catch (e) {
        setState(() {
          _isLoading = false;
        });
        var message = 'an erorr ocurred';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ));
      } catch (err) {
        setState(() {
          _isLoading = false;
        });
        print(err.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final md = MediaQuery.of(context).size;
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email ID',
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.alternate_email),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Please enter valid email address';
              }
              return null;
            },
            onSaved: (value) {
              _email = value!;
            },
          ),
          TextFormField(
            controller: _pass,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.lock_outline_rounded),
                )),
            validator: (value) {
              if (value!.isEmpty || value.length < 6) {
                return 'Please enter strong password with at least 6 characters';
              }
              return null;
            },
            onSaved: (value) {
              _password = value!;
            },
          ),
          widget.isLogin
              ? SizedBox()
              : TextFormField(
                  obscureText: true,
                  controller: _conPass,
                  decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.lock_person_outlined),
                      )),
                  validator: (value) {
                    if (value!.isEmpty || value != _pass.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _trySubmit();
              print(_email);
              print(_password);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 30, 113, 238),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(double.infinity, md.height * 0.06)),
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Text(widget.isLogin ? "Login" : 'Register'),
          ),
        ],
      ),
    );
  }
}
