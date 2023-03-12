import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail-page';

  // final String newsTitle;
  // const DetailPage({required this.newsTitle});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final title = args['title'];
    final description = args['description'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail page"),
      ),
      body: Container(
        child: Text(title!),
      ),
    );
  }
}
