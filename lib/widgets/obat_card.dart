import 'package:flutter/material.dart';
import '../models/obat.dart';

class ObatCard extends StatelessWidget {
  final Obat obat;
  final VoidCallback onDelete;

  const ObatCard({super.key, required this.obat, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shadowColor: Colors.green.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),

        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.green.shade100,
          child: const Icon(Icons.medication, color: Colors.green, size: 28),
        ),

        title: Text(
          obat.namaObat,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Colors.grey),
              const SizedBox(width: 5),
              Text(obat.jamMinum, style: const TextStyle(fontSize: 15)),
            ],
          ),
        ),

        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete_forever, color: Colors.red, size: 28),
        ),
      ),
    );
  }
}
