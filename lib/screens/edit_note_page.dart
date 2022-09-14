// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notely/utils/util.dart';

class EditNotePage extends StatefulWidget {
  EditNotePage(this.doc, {super.key});
  QueryDocumentSnapshot doc;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  final controller = TextEditingController();
  String content = '';
  String title = '';

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.doc['notely_title']);
    _contentController =
        TextEditingController(text: widget.doc['notely_content']);
    content = _contentController.text.trim();
    title = _titleController.text.trim();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(controller.value.text);
    return Scaffold(
      appBar: Helper.customppBar(
        'Edit Notes',
        InkWell(onTap: () => Navigator.pop(context), child: AppIcons.back_icon),
        AppIcons.more_icon,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: AppTheme.titleTextStyle,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _contentController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Note content',
              ),
              style: AppTheme.textStyle,
            )
          ],
        ),
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppTheme.orangeColor,
        child: const Icon(Icons.save),
      ),
    );
  }

  void onPressed() async {
    var firestore = FirebaseFirestore.instance.collection(notely);
    FirebaseFirestore.instance.collection(notely).get().then(
      (value) async {
        Map<String, dynamic> titleData = {
          notelyTitle: _titleController.text.trim().toString(),
        };
        Map<String, String> contentData = {
          notelyContent: _contentController.value.text,
        };
        for (var element in value.docs) {
          final titleElement = element[notelyTitle];
          final contentElement = element[notelyContent];
          if (titleElement == title && contentElement == content) {
            firestore.doc(element.id).update(titleData);
            firestore
                .doc(element.id)
                .update(contentData)
                .then((value) => Navigator.pop(context));
          }
        }
      },
    );
  }
}
