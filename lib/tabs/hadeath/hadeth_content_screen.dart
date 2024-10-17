import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/hadeath/hadeth.dart';
import 'package:islamiapp/widgets/loading_indicator.dart';

class HadethContentScreen extends StatelessWidget {
  static const String routeName = '/hadeth-content';

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            hadeth.title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).height * 0.02,
              vertical: 54),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: ListView.builder(
            itemBuilder: (_, index) => Text(
              hadeth.content[index],
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            itemCount: hadeth.content.length,
          ),
        ),
      ),
    );
  }
}
