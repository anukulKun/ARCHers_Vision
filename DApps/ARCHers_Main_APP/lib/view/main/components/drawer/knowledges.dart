import 'package:flutter/material.dart';

import 'knowledge.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Future Tech stack',style: TextStyle(color: Colors.white),),
        ),
        KnowledgeText(knowledge: 'Docker'),
        KnowledgeText(knowledge: 'Kubernetes'),
        KnowledgeText(knowledge: 'Motoko'),
      ],
    );
  }

}
