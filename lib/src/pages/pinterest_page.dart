import 'package:disenos/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:disenos/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            PinterestGrid(),
            PinterestMenuLocation()
          ],
        ),
      ),
    );
  }
}

class PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Positioned(
      bottom: 30,
      child: PinterestMenu(
        mostrar: mostrar,
        backgroundColor: appTheme.scaffoldBackgroundColor,
        activeColor: appTheme.accentColor,
        // inactiveColor: Colors.blue,
        items: [
          PinterestButton(icon: Icons.pie_chart, onPressed: (){ print('Icon pie_chart');}),
          PinterestButton(icon: Icons.search, onPressed: (){ print('Icon search');}),
          PinterestButton(icon: Icons.notifications, onPressed: (){ print('Icon notifications');}),
          PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print('Icon supervised_user_circle');}),
        ],
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() { 
    super.initState();
    controller.addListener((){
      // print('ScrollListener ${controller.offset}');
      controller.offset > scrollAnterior && controller.offset > 0 ? Provider.of<_MenuModel>(context, listen: false).mostrar = false : Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      scrollAnterior = controller.offset;
    });
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;
  @protected
  set mostrar(bool mostrar) {
    _mostrar = mostrar;
    notifyListeners();
  }
}