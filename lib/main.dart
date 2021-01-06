import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streambuilder_example/page/streambuilder_controller_page.dart';
import 'package:streambuilder_example/page/streambuilder_local_page.dart';
import 'package:streambuilder_example/page/streambuilder_network_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'StreamBuilder';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 2;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('StreamBuilder', style: style),
          title: Text('Local'),
        ),
        BottomNavigationBarItem(
          icon: Text('StreamBuilder', style: style),
          title: Text('Controller'),
        ),
        BottomNavigationBarItem(
          icon: Text('StreamBuilder', style: style),
          title: Text('Network'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return StreamBuilderLocalPage();
      case 1:
        return StreamBuilderControllerPage();
      case 2:
        return StreamBuilderNetworkPage();
      default:
        return Container();
    }
  }
}
