import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hiddenP = true;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _conPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _conPassController.dispose();

    _nameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();
    _passFocus.dispose();
    
    super.dispose();
  }

  void _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Full Name *',
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _nameController.clear();
                        });
                      },
                      icon: Icon(Icons.clear)),
                  // errorBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(10.0),
                  //     ),
                  //     borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(10.0),
                  //   ),
                  //   borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //     borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  )),
              validator: _validateName,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _emailFocus);
              },
              controller: _phoneController,
              decoration:  InputDecoration(
                labelText: 'Phone number *',
                prefixIcon: Icon(
                  Icons.phone,
                ),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _phoneController.clear();
                  });
                }, icon: Icon(Icons.clear)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value)=> _validatePhone(value)?null:'Phone nunber format is not correct',
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              focusNode: _emailFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _emailFocus, _passFocus);
              },
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email *',
                hintText: 'Enter email address',
                icon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'A short information about you',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              inputFormatters: [LengthLimitingTextInputFormatter(100)],
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              focusNode: _passFocus,
              controller: _passController,
              obscureText: _hiddenP,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Password *',
                icon: const Icon(Icons.security),
                suffixIcon: IconButton(
                  icon:
                      Icon(_hiddenP ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hiddenP = !_hiddenP;
                    });
                  },
                ),
              ),
              validator: _validatePassword,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _conPassController,
              decoration:
                  const InputDecoration(labelText: 'Confirm password *'),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                'register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
    print('Name ${_nameController.text}');
    print('phone ${_phoneController.text}');
    print('Email ${_emailController.text}');
    print('Password ${_passController.text}');
    print('Confirm password ${_conPassController.text}');
  }

  String? _validateName(value) {
    final _nameExp = RegExp(r'^[A-Za-z]+$');
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!_nameExp.hasMatch(value)) {
      return 'Please enter valid name';
    }
    return null;
  }
  bool _validatePhone(value) {
    final _phoneExp = RegExp(r'\d\d\d\d\d\d\d\d\d$');
    return _phoneExp.hasMatch(value);
  }

  String? _validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Email can\'t be blank';
    } else if (!value.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value.length !=8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }
}
