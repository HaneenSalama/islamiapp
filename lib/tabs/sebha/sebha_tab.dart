import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbeehCount = 0;
  double rotationAngle = 0;

  void incrementTasbeeh() {
    setState(() {
      tasbeehCount++;
      rotationAngle += 0.2;
    });
  }

  String getButtonText() {
    if (tasbeehCount % 99 < 33) {
      return 'سبحان الله';
    } else if (tasbeehCount % 99 < 66) {
      return 'الحمد لله';
    } else {
      return 'الله أكبر';
    }
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            //alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Image.asset(
                  'assets/images/${Provider.of<SettingsProvider>(context).sebhaHead}.png',
                  width: 150,
                  height: 100,
                ),
              ),
              Positioned(
                bottom: -50,
                child: GestureDetector(
                  onTap: incrementTasbeeh,
                  child: Transform.rotate(
                    angle: rotationAngle,
                    child: Image.asset(
                      'assets/images/${Provider.of<SettingsProvider>(context).sebhaBody}.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
          Text(
            'عدد التسبيحات',
            style: TextStyle(
              color: settingsProvider.isDark
                  ? AppTheme.white
                  : AppTheme.darkPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: settingsProvider.isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.lightPrimary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              '$tasbeehCount',
              style: TextStyle(
                color:
                    settingsProvider.isDark ? AppTheme.white : AppTheme.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: settingsProvider.isDark
                  ? AppTheme.gold
                  : AppTheme.lightPrimary,
            ),
            child: Text(
              getButtonText(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
