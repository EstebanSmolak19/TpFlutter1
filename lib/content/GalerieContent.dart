import 'package:flutter/material.dart';

class GalerieContent extends StatelessWidget {
  const GalerieContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = List.generate(
      15,
      (index) => 'https://picsum.photos/200/200?random=${index + 1}',
    );

    List<Widget> buildRows() {
      List<Widget> rows = [];
      for (int i = 0; i < images.length; i += 3) {
        rows.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: images
                  .sublist(i, (i + 3 > images.length) ? images.length : i + 3)
                  .map(
                    (img) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        img,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      }
      return rows;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: buildRows(),
      ),
    );
  }
}