import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lati/Model/to_do.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.todo});
  final ToDo todo;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo.title),
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              widget.todo.isChecked ? Icons.check : Icons.close,
              color: widget.todo.isChecked ? Colors.green : Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
