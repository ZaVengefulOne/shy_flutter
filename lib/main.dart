import 'dart:ffi';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
void main() {
  runApp(const MyApp());
}

class DiClass
{
 String passedString = "Эта строка будет передана через всё приложение!";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'VengefluTter',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
        ),
      routerConfig: _router,
    );
    // return MaterialApp(
    //
    //   home: const WelcomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

class TestInheritedWidget extends InheritedWidget {
  TestInheritedWidget({
    required super.key,
    required super.child,
  });

  static TestInheritedWidget? maybeOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<TestInheritedWidget>();

  static TestInheritedWidget? of (BuildContext context) => context.dependOnInheritedWidgetOfExactType<TestInheritedWidget>();

  final String passedString = "Эта строка передаётся при помощи InheritedWidget!";
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;


}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {


  @override
  Widget build(BuildContext context) {
    GetIt.instance.registerSingleton<DiClass>(DiClass());
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Добро пожаловать в Помощник поэта! \nНажмите на кнопку ниже, чтобы начать', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 48),
            ), FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondWidget()));
            },child: const Icon(Icons.start_sharp),),
          ],
        ),
      ),

    );
  }
}

class SecondWidget extends StatelessWidget{
  const SecondWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TestInheritedWidget.of(context)?.passedString = "Эта строка была передана через всё приложение";
    return Scaffold(
      appBar: AppBar(title: const Text("Основы работы с приложением")),
      body: Center( child:
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text("Помощник поэта - приложение, позволяющее учиться рифмовать как Бог", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 48), textAlign: TextAlign.center),
            FloatingActionButton(onPressed: ()
            {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ThirdWidget()));
      },child: const Icon(Icons.navigate_next_sharp))])),
    );
  }
}

class ThirdWidget extends StatelessWidget{
  const ThirdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Основы работы с приложением: 2")),
      body: Center( child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,   children: <Widget>[ const Text("Помощник поэта включает в себя: "
          "\nГенератор рифм, который позволит тебе подобрать рифму даже к самым сложным и необычным словам"
          "\nЗаметки, в которых можно сохранить все порывы вдохновения, пришедшие тебе в голову"
          "\n Библиотеку статей, где ты сможешь узнать все ньюансы и тонкости стихосложения", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 36), textAlign: TextAlign.center),
        FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const FourthWidget()));
      },child: const Icon(Icons.navigate_next_sharp))])),
    );
  }
}

class FourthWidget extends StatelessWidget{
  const FourthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Основы работы с приложением: 3")),
      body: Center( child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,   children: <Widget>[ const Text("По всем вопросам обращайтесь в телегу "
          "\n@The_VengefulOne", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 36), textAlign: TextAlign.center), FloatingActionButton(onPressed: (){
        // Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainScreen()), (Route<dynamic> route) => true);
        context.go('/main');
      },child: const Icon(Icons.done_sharp))]),
    ));
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}
class _MainScreen extends State<MainScreen> {
  String futureText = "Выполняется продолжительная работа при помощи Future, пожалуйста, подождите...";
  String asyncText = "А здесь выполняется Async-работа, ожидайте...";
  @override
  Widget build(BuildContext context) {
    late String platform;
    final passedString = TestInheritedWidget.of(context)?.passedString;
    var passedClass = GetIt.instance<DiClass>();
    if (kIsWeb == true){
      platform = "Web";
    }else {
      if (Platform.isAndroid == true) {
        platform = "Android";
      } else if (Platform.isLinux == true) {
        platform = "Linux";
      } else if (Platform.isWindows == true) {
        platform = "Windows";
      } else if (Platform.isMacOS == true) {
        platform = "MacOS";
      } else if (Platform.isIOS == true) {
        platform = "IOS";
      } else if (Platform.isFuchsia == true) {
        platform = "Fuchsia";
      }
    }


    Future<String> getMessage(){
      return Future.delayed(const Duration(seconds: 3), () => "Эмуляция продолжительной работы завершена успешно!");
    }
    Future<String> messageFuture = getMessage();
    messageFuture.then((message){
      setState(() {
        futureText = message;
      });
    });


    Future<String> asyncGetMessage() {
      return Future.delayed(const Duration(seconds: 6), () => "Тоже успешно выполнена!");
    }
    Future<void> messageAsync() async {
      String asyncMessage = await asyncGetMessage();
      setState(() {
        asyncText = asyncMessage;
      });
    }
    messageAsync();


    return Scaffold(
      appBar: AppBar(title: const Text("Главная")),
      body: Center(child: Column (mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget> [
         Text("Главный экран будущего приложения на $platform",
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 48), textAlign: TextAlign.center),
      Text(futureText),
        Text(asyncText),
      Text(TestInheritedWidget.of(context)!.passedString),
      Text(passedClass.passedString),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget> [
        FloatingActionButton(onPressed: (){
          context.go('/notes');
      },child: const Icon(Icons.notes)),
        FloatingActionButton(onPressed: (){
          context.go('/generator');
        },child: const Icon(Icons.abc_sharp)),
        FloatingActionButton(onPressed: (){
          context.go('/library');
        },child: const Icon(Icons.library_books_sharp)),
        FloatingActionButton(onPressed: (){
          context.go('/pics');
        },child: const Icon(Icons.image_sharp))
  ])]))
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key, required this.title});
  final String title;
  @override
  State<NotesPage> createState() => _NotesPageState();
}
class _NotesPageState extends State<NotesPage> {
  final items = List.generate(25, (index) => 'Заметка №${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView( child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget> [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget> [
          FloatingActionButton(onPressed: () => setState(() => items.remove("Заметка №${items.length}")), child: const Icon(Icons.remove_circle_outline_sharp),),
          FloatingActionButton(onPressed: () => setState(() => items.add("Заметка №${items.length+1}")), child: const Icon(Icons.add_circle_outline_sharp),)],),
      Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.map((item) => Text(item,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 48), textAlign: TextAlign.center)).toList(),
          ),
      ]),)
    );
  }
}

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key, required this.title});
  final String title;
  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}
class _GeneratorPageState extends State<GeneratorPage> {
  final items = List.generate(100, (index) => 'Рифма №${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(children: items.map((item) => GestureDetector(
        key: ValueKey(item),
        onTap: () => setState(() => items.remove(item)),
        onLongPress: () => setState(() => items.add("Рифма №${items.length+1}")),
        child: Padding(padding: const EdgeInsets.all(16),
        child: Text(item),
        ),
      )).toList()
      ,)
    );
  }
}

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key, required this.title});
  final String title;
  @override
  State<LibraryPage> createState() => _LibraryPageState();
}
class _LibraryPageState extends State<LibraryPage> {
  final items = List.generate(100, (index) => 'Статья №${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget> [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget> [
          FloatingActionButton(onPressed: () => setState(() => items.remove("Статья №${items.length}")), child: const Icon(Icons.remove_circle_outline_sharp),),
          FloatingActionButton(onPressed: () => setState(() => items.add("Статья №${items.length+1}")), child: const Icon(Icons.add_circle_outline_sharp),)],),
          Expanded(child: SizedBox(height: 200.0, child: ListView.separated(
            itemBuilder: (_, position) => Text(items[position], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 48), textAlign: TextAlign.center),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: items.length,
          ),))
        ],)
    );
  }
}

class PicsPage extends StatelessWidget{
  const PicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List _urls = [
      "http://emosurf.com/i/0001yn0InBPd/03.jpg",
      "https://travel-in-time.org/wp-content/uploads/2019/06/pero-i-chernila-2.jpg",
      "https://abrakadabra.fun/uploads/posts/2022-02/1645747777_12-abrakadabra-fun-p-fon-pero-i-chernilnitsa-18.jpg",
      "https://s.poembook.ru/theme/1d/d4/a6/4248b282468f0d7e583e28bc34de34a2324c1406.png",
      "https://stihi.ru/pics/2015/09/03/9851.jpg",
    ];
    return Scaffold(
        body: SingleChildScrollView( child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,   children: <Widget>[
          CachedNetworkImage(imageUrl: _urls[0],
            progressIndicatorBuilder: (context, url, progress) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error, color: Colors.red,),),),
          CachedNetworkImage(imageUrl: _urls[1],
            progressIndicatorBuilder: (context, url, progress) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error, color: Colors.red,),),),
          CachedNetworkImage(imageUrl: _urls[2],
            progressIndicatorBuilder: (context, url, progress) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error, color: Colors.red,),),),
          CachedNetworkImage(imageUrl: _urls[3],
            progressIndicatorBuilder: (context, url, progress) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error, color: Colors.red,),),),
          CachedNetworkImage(imageUrl: _urls[4],
            progressIndicatorBuilder: (context, url, progress) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error, color: Colors.red,),),),
          FloatingActionButton(onPressed: (){
            context.go('/main');
          },child: const Icon(Icons.arrow_back_sharp))
        ]),
        ));
  }
}

final GoRouter _router = GoRouter(routes: <RouteBase>[GoRoute(path: '/',
  builder: (BuildContext context, GoRouterState state){
    return const WelcomePage(title: 'Добро пожаловать!');
  },
  routes: <RouteBase>[
    GoRoute(path: 'library',builder: (BuildContext context, GoRouterState state){
      return const LibraryPage(title: 'Библиотека статей',);
    }),
    GoRoute(path: 'generator',builder: (BuildContext context, GoRouterState state){
      return const GeneratorPage(title: 'Генератор рифм',);
    }),
    GoRoute(path: 'notes',builder: (BuildContext context, GoRouterState state) {
      return const NotesPage(title: 'Заметки',);
    }),
    GoRoute(path: 'pics',builder: (BuildContext context, GoRouterState state) {
      return const PicsPage();
    }),
    GoRoute(path: 'main',builder: (BuildContext context, GoRouterState state) {
      return MainScreen();
    }),
  ],
)]);