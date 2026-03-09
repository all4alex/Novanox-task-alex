import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:novanox_task_for_alex/widgets/t_mama_default_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {





  void _toggleLanguage(BuildContext context) {
    final currentLocale = context.locale;

    if (currentLocale.languageCode == 'he') {
      context.setLocale(const Locale('en'));
    } else {
      context.setLocale(const Locale('he'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
      final isEnglish = context.locale.languageCode == 'en';
    return Scaffold(
      
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: screenSize.height *.8, child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
              
              children: [

               TMamaDefaultButton(
              text: ('growth_spurts'.tr()),
            )
            ],),),
         
         IconButton(
            onPressed: () => _toggleLanguage(context),
            icon: Icon(Icons.g_translate_rounded),
            color: Colors.blueAccent,
            tooltip: isEnglish ? "Switch to Hebrew" : "Switch to English",
          ),
          Text(context.locale.toString(), style: TextStyle(fontSize: 16, color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}