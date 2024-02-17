import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The [AppBar] title text should update its message
          // according to the system locale of the target platform.
          // Switching between English and Spanish locales should
          // cause this text to update.
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.helloWorld),
        )
    );
  }
}
