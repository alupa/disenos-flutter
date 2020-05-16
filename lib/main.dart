import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos/src/theme/theme.dart';
import 'package:disenos/src/pages/launcher_page.dart';
import 'package:disenos/src/pages/launcher_tablet_page.dart';
import 'package:disenos/src/models/layout_model.dart';
 
void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => new ThemeChanger(2)),
      ChangeNotifierProvider(create: (_) => new LayoutModel()),
    ],
    child: MyApp()
  )
);

// void main() => runApp(
//   ChangeNotifierProvider(
//     create: (_) => new ThemeChanger(2),
//     child: MyApp()
//   )
// );
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(builder: (
        BuildContext context, Orientation orientation) {
          // print('Orientation $orientation');
          // return Container(
          //   child: LauncherPage(),
          // );
          final screenSize = MediaQuery.of(context).size;
          return screenSize.width > 500 ? LauncherTabletPage() : LauncherPage();
        },
      )
    );
  }
}