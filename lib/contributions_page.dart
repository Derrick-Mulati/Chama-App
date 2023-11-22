import 'package:flutter/material.dart';


class ContributionsPage extends StatefulWidget {
  const ContributionsPage({super.key});

  @override
  State<ContributionsPage> createState() => _ContributionsPageState();
}

class _ContributionsPageState extends State<ContributionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contributions'),
      ),
    );
  }
}
