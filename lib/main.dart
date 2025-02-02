import 'package:flutter/material.dart';
import 'package:chama_app/contributions_page.dart';
import 'package:chama_app/home_page.dart';
import 'package:chama_app/members_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  final List<Widget> pages = const [
    HomePage(),
    ContributionsPage(),
    MembersPage(),
  ];

  final List<String> pageTitles = ['Home', 'Contributions', 'Members'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitles[currentPage]),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              ThemeMode mode = Theme.of(context).brightness == Brightness.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
              setState(() {
                ThemeMode.system;
              });
            },
          )
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pages[currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        backgroundColor: Colors.blue.shade50,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Contributions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Members',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Quick Actions",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text("Add New Contribution"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_add),
                      title: Text("Add New Member"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
