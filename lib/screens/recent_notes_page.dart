import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notely/screens/add_note_page.dart';
import 'package:notely/screens/edit_note_page.dart';
import 'package:notely/screens/profile_page.dart';
import 'package:notely/utils/util.dart';
import 'package:notely/widget/note_card.dart';

class RecentNotesPage extends ConsumerWidget {
  static const id = 'recentPage';
  const RecentNotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Helper.customppBar(
        'Recent Notes',
        InkWell(
            onTap: () => Navigator.pushNamed(context, ProfilePage.id),
            child: AppIcons.filter_icon),
        AppIcons.search_icon,
      ),
      body: ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Notely').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return StaggeredGrid.count(
                  crossAxisCount: 2,
                  children: snapshot.data!.docs
                      .map((notes) => noteCard(
                            () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EditNotePage(notes))),
                            notes,
                            ref,
                          ))
                      .toList(),
                );
              }
              return Text(
                'There\'s no Notes',
                style: AppTheme.titleTextStyle,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AddNotePage())),
        backgroundColor: AppTheme.orangeColor,
        label: const Text('Add Note'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
