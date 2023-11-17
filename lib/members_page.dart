import 'package:flutter/material.dart';

const int itemCount = 10;

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return  ListTile(
          title: Text('Item ${(index+1)}'),
          leading: const Icon(Icons.person),
          trailing: const Icon(Icons.select_all),
          onTap: (){
            debugPrint('Item ${(index+1)} Selected');
          },
        );
      },
    );
  }
}
