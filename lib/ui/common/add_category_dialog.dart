import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../src/repository/todo_repo.dart';

class AddCategoryDialog extends StatefulWidget {
  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(64),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Add a category',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Name of the category',
              ),
              onSubmitted: (_) => _addEntry(),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('Add'),
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  onPressed: _addEntry,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addEntry() {
    if (_controller.text.isNotEmpty) {
      RepositoryProvider.of<TodoRepo>(context).addCategory(_controller.text);
      Navigator.of(context).pop();
    }
  }
}
