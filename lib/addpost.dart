import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'post.dart';

// ignore: must_be_immutable, camel_case_types
class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('posts');

  addnote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'title': title.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const posts()));
              });
            },
            child: const Text(
              "save",
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'title',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
