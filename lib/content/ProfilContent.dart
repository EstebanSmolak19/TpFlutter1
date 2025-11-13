import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyMedium?.color;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar avec ombre
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
          ),
          const SizedBox(height: 16),

          // Nom
          Text(
            "Matheo le BG",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: textColor,
                  fontSize: 22,
                ),
          ),
          const SizedBox(height: 4),

          // Email
          Text(
            "root@gmail.com",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: textColor?.withOpacity(0.7),
                  fontSize: 14,
                ),
          ),
          const SizedBox(height: 24),

          // Boutons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 18),
                label: const Text("Modifier"),
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  side: BorderSide(color: Colors.grey.shade400),
                  foregroundColor: textColor,
                ),
              ),
              const SizedBox(width: 16),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, size: 18),
                label: const Text("Se déconnecter"),
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  side: BorderSide(color: Colors.red.shade400),
                  foregroundColor: Colors.red.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Infos téléphone / adresse 
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[850]
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone, color: textColor),
                  title: Text(
                    "Téléphone",
                    style: TextStyle(color: textColor),
                  ),
                  subtitle: Text(
                    "+33 6 12 34 56 78",
                    style: TextStyle(color: textColor?.withOpacity(0.7)),
                  ),
                ),
                Divider(
                  height: 1,
                  color: textColor?.withOpacity(0.3),
                ),
                ListTile(
                  leading: Icon(Icons.location_on, color: textColor),
                  title: Text(
                    "Adresse",
                    style: TextStyle(color: textColor),
                  ),
                  subtitle: Text(
                    "123 Rue Exemple, Paris, France",
                    style: TextStyle(color: textColor?.withOpacity(0.7)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}