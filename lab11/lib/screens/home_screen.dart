import 'package:flutter/material.dart';

import '../models/note_item.dart';
import '../services/storage_service.dart';

class HomeScreen extends StatefulWidget {
  final StorageService storage;
  final bool isDark;
  final ValueChanged<bool> onDarkChanged;

  const HomeScreen({
    super.key,
    required this.storage,
    required this.isDark,
    required this.onDarkChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _userName;
  late List<NoteItem> _notes;

  final _nameController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userName = widget.storage.userName;
    _notes = widget.storage.loadNotes();
    _nameController.text = _userName == 'Guest User' ? '' : _userName;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  String _now() {
    final d = DateTime.now();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(d.day)}.${two(d.month)}.${d.year} ${two(d.hour)}:${two(d.minute)}';
  }

  Future<void> _saveName() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;
    await widget.storage.setUserName(name);
    if (!mounted) return;
    setState(() => _userName = name);
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Name saved')));
  }

  Future<void> _addNote() async {
    final title = _noteController.text.trim();
    if (title.isEmpty) return;
    final note = NoteItem(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      dateText: _now(),
    );
    setState(() => _notes = [note, ..._notes]);
    _noteController.clear();
    await widget.storage.saveNotes(_notes);
  }

  Future<void> _toggleNote(NoteItem note) async {
    setState(() {
      _notes = _notes
          .map((n) => n.id == note.id
              ? n.copyWith(isCompleted: !n.isCompleted)
              : n)
          .toList();
    });
    await widget.storage.saveNotes(_notes);
  }

  Future<void> _deleteNote(NoteItem note) async {
    setState(() => _notes = _notes.where((n) => n.id != note.id).toList());
    await widget.storage.saveNotes(_notes);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Notes & Settings Vault')),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: scheme.primaryContainer,
              child: Text(
                'Hello, $_userName',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: scheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SwitchListTile(
              title: const Text('Dark mode'),
              secondary: Icon(widget.isDark ? Icons.dark_mode : Icons.light_mode),
              value: widget.isDark,
              onChanged: widget.onDarkChanged,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _saveName(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(onPressed: _saveName, child: const Text('Save')),
                ],
              ),
            ),
            const Divider(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _noteController,
                      decoration: const InputDecoration(
                        labelText: 'New note',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _addNote(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton.icon(
                    onPressed: _addNote,
                    icon: const Icon(Icons.add),
                    label: const Text('Add'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _notes.isEmpty
                  ? const Center(child: Text('No notes yet'))
                  : ListView.separated(
                      itemCount: _notes.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, i) {
                        final n = _notes[i];
                        return ListTile(
                          leading: Checkbox(
                            value: n.isCompleted,
                            onChanged: (_) => _toggleNote(n),
                          ),
                          title: Text(
                            n.title,
                            style: TextStyle(
                              decoration: n.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          subtitle: Text(n.dateText),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => _deleteNote(n),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
