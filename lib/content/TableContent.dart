import 'package:flutter/material.dart';

class TableContent extends StatelessWidget {
  const TableContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> data = [
      ['ID', 'Nom', 'Age'],
      ['1', 'Alice', '25'],
      ['2', 'Bob', '30'],
      ['3', 'Charlie', '28'],
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        border: TableBorder.all(color: Colors.grey),
        columnWidths: const {
          0: FixedColumnWidth(50),
          1: FlexColumnWidth(),
          2: FixedColumnWidth(50),
        },
        children: data.map((row) {
          return TableRow(
            decoration: row == data[0]
                ? const BoxDecoration(color: Color.fromARGB(255, 200, 200, 200))
                : null,
            children: row.map((cell) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cell,
                  textAlign: TextAlign.center,
                  style: row == data[0]
                      ? const TextStyle(fontWeight: FontWeight.bold)
                      : null,
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}