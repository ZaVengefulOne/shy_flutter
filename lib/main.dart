import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(title: 'Flutter Demo Home Page'),
    );
  }
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondWidget()));
            },child: const Icon(Icons.start_sharp),),
          ],
        ),
      ),

    );
  }
}

class SecondWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Основы работы с приложением")),
      body: Center( child:
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text("Помощник поэта - приложение, позволяющее учиться рифмовать как Бог", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 48), textAlign: TextAlign.center),
            FloatingActionButton(onPressed: ()
            {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdWidget()));
      },child: const Icon(Icons.navigate_next_sharp))])),
    );
  }
}

class ThirdWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Основы работы с приложением: 2")),
      body: Center( child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,   children: <Widget>[ Text("Помощник поэта включает в себя: "
          "\nГенератор рифм, который позволит тебе подобрать рифму даже к самым сложным и необычным словам"
          "\nЗаметки, в которых можно сохранить все порывы вдохновения, пришедшие тебе в голову"
          "\n Библиотеку статей, где ты сможешь узнать все ньюансы и тонкости стихосложения", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 36), textAlign: TextAlign.center),
        FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => FourthWidget()));
      },child: const Icon(Icons.navigate_next_sharp))])),
    );
  }
}

class FourthWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Основы работы с приложением: 3")),
      body: Center( child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,   children: <Widget>[ Text("По всем вопросам обращайтесь в телегу "
          "\n@The_VengefulOne", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 36), textAlign: TextAlign.center), FloatingActionButton(onPressed: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage()), (Route<dynamic> route) => false);
      },child: const Icon(Icons.done_sharp))]),
    ));
  }
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Главная")),
      body: Center(child: Column (mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget> [
        const Text("Главный экран будущего приложения",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 48), textAlign: TextAlign.center),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget> [
        FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NotesPage(title: 'Заметки',)));
      },child: const Icon(Icons.notes)),
        FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => GeneratorPage(title: 'Генератор рифм',)));
        },child: const Icon(Icons.abc_sharp)),
        FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LibraryPage(title: 'Библиотека статей',)));
        },child: const Icon(Icons.library_books_sharp))
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
          FloatingActionButton(onPressed: () => setState(() => items.remove("Заметка №${items.length}")), child: Icon(Icons.remove_circle_outline_sharp),),
          FloatingActionButton(onPressed: () => setState(() => items.add("Заметка №${items.length+1}")), child: Icon(Icons.add_circle_outline_sharp),)],),
      Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.map((item) => Text(item,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 48), textAlign: TextAlign.center)).toList(),
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
          FloatingActionButton(onPressed: () => setState(() => items.remove("Статья №${items.length}")), child: Icon(Icons.remove_circle_outline_sharp),),
          FloatingActionButton(onPressed: () => setState(() => items.add("Статья №${items.length+1}")), child: Icon(Icons.add_circle_outline_sharp),)],),
          Expanded(child: SizedBox(height: 200.0, child: ListView.separated(
            itemBuilder: (_, position) => Text(items[position], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 48), textAlign: TextAlign.center),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: items.length,
          ),))
        ],)
    );
  }
}
