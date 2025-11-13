import 'package:flutter/material.dart';

class GalerieContent extends StatelessWidget {
  const GalerieContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = List.generate(
      15,
      (index) => 'https://picsum.photos/300/300?random=${index + 1}',
    );

    final textColor = Theme.of(context).textTheme.bodyMedium?.color;

    List<Widget> buildRows() {
      List<Widget> rows = [];

      for (int i = 0; i < images.length; i += 3) {
        rows.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: images
                  .sublist(i, (i + 3 > images.length) ? images.length : i + 3)
                  .asMap().entries
                  .map(
                    (entry) {
                      final int imgIndex = i + entry.key + 1;
                      final String img = entry.value;

                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              img,
                              width: 110,
                              height: 110,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return Container(
                                  width: 110,
                                  height: 110,
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Image $imgIndex',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: textColor, // couleur du thème
                                ),
                          ),
                        ],
                      );
                    },
                  )
                  .toList(),
            ),
          ),
        );
      }

      return rows;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: buildRows(),
      ),
    );
  }
}