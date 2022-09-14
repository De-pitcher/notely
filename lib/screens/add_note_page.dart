import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notely/utils/util.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.customppBar(
        'Add Note',
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
        onPressed: _onPressed,
        backgroundColor: AppTheme.orangeColor,
        child: const Icon(Icons.save),
      ),
    );
  }

  _onPressed() {
    Map<String, dynamic> data = {
      notelyTitle: _titleController.value.text,
      notelyContent: _contentController.value.text
    };
    FirebaseFirestore.instance.collection(notely).add(data).then(
      (value) {
        Navigator.pop(context);
        debugPrint(value.id);
      },
    ).catchError(
      // ignore: invalid_return_type_for_catch_error
      (error) => debugPrint('Failed to ad new Note due to $error'),
    );
  }
}
