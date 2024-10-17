import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/quraan/quran_tab.dart';
import 'package:islamiapp/widgets/loading_indicator.dart';

class SuraContentScreen extends StatefulWidget {
  SuraContentScreen({super.key});
  static const String routeName = '/sura-content';

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> ayat = [
    ' بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ ',
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    ' الرَّحْمَنِ الرَّحِيمِ',
    ' مَالِكِ يَوْمِ الدِّينِ',
    ' إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    ' اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
    ' صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين',
  ];

  late SuraContentArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
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
            args.suraName,
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
          child: ayat.isEmpty
              ? LoadingIndicator()
              : ListView.builder(
                  itemBuilder: (_, index) => Text(
                    ayat[index],
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  itemCount: ayat.length,
                ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    await Future.delayed(Duration(seconds: 0));
    String sura =
        await rootBundle.loadString('assets/texts/${args.index + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
    return;
  }
}
