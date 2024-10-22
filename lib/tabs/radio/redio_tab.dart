// import 'package:flutter/material.dart';

// class RadioTab extends StatelessWidget {
//   const RadioTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Radio'),
//     );
//   }
// }

/////////////////////////////
///

import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/radio_image.png',
          width: 300,
          height: 200,
        ),
        SizedBox(height: 20),
        Text(
          'إذاعة القرآن الكريم',
          style: TextStyle(
            color:
                settingsProvider.isDark ? AppTheme.white : AppTheme.darkPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_previous, size: 36),
              color: Color(0xffB7935F),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_arrow, size: 36),
              color: Color(0xffB7935F),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_next, size: 36),
              color: Color(0xffB7935F),
            ),
          ],
        ),
      ],
    );
  }
}
