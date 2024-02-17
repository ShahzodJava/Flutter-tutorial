import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multi_language/main.dart';

import '../utils/language.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(text(context).helloWorld),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).height*0.7,
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () async {
                Locale _locale = await setLocale(ENGLISH);
                MyApp.setLocale(context, _locale);
              },
              leading: const Text('🏴󠁧󠁢󠁥󠁮󠁧󠁿'),
              title: Text(text(context).english),
            ),
            ListTile(
                onTap: () async {
                  Locale _locale = await setLocale(UZBEK);
                  MyApp.setLocale(context, _locale);
                },
              leading: const Text('🇺🇿'),
              title: Text(text(context).uzbek)
            ),
          ],
        ),
      ),
    );
  }
}
