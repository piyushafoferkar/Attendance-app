import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'post.dart';

// ignore: must_be_immutable, camel_case_types
class editnote extends StatefulWidget {
  DocumentSnapshot docid;
  editnote({super.key, required this.docid});

  @override
  // ignore: library_private_types_in_public_api
  _editnoteState createState() => _editnoteState();
}

// ignore: camel_case_types
class _editnoteState extends State<editnote> {
  TextEditingController title = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get('title'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'title': title.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const posts()));
              });
            },
            child: const Text("save"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const posts()));
              });
            },
            child: const Text("delete"),
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
