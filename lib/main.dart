import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos/src/theme/theme.dart';
import 'package:disenos/src/pages/launcher_page.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => new ThemeChanger(2),
    child: MyApp()
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage()
    );
  }
}