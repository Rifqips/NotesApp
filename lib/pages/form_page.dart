import 'package:flutter/material.dart';
import 'package:flutter_habiskerja_notes_app/models/note.dart';
import 'package:flutter_habiskerja_notes_app/utils/notes_database.dart';

class FormPage extends StatefulWidget {
  final Note? note;
  const FormPage({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      descController.text = widget.note!.description;
    }
    super.initState();
  }

  Future updateNote() async {
    final note = widget.note!.copyWith(
      title: titleController.text,
      description: descController.text,
    );

    await NotesDatabase.instance.update(note);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  Future addNote() async {
    final note = Note(
      title: titleController.text,
      description: descController.text,
      time: DateTime.now(),
    );
    await NotesDatabase.instance.create(note);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
        actions: [
          InkWell(
            onTap: () {
              if (widget.note != null) {
                updateNote();
              } else {
                addNote();
              }
            },
            child: const Icon(Icons.save),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            TextFormField(
              controller: titleController,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Title',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: descController,
              maxLines: 16,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'catatan...',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
