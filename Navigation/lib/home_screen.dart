import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  void openDetails(BuildContext ctx, String title) {
    // Navigator.push(
    //   ctx,
    //   MaterialPageRoute(builder: (_) {
    //     return DetailPage(newsTitle: title,);
    //   }),
    // );

    Navigator.pushNamed(ctx, DetailPage.routeName, arguments: {
      'title': title,
      'description':'This is a description'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Container(
        child: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => openDetails(context, 'click 1'),
              child: Text('Click 1'),
            ),
          ],
        ),
      ),
    );
  }
}
