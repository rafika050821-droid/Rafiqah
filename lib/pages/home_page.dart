import 'package:flutter/material.dart';
import '../models/obat.dart';
import '../widgets/obat_card.dart';
import 'tambah_obat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Obat> daftarObat = [];

  Future<void> bukaTambahObat() async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TambahObat()),
    );

    if (hasil != null && hasil is Obat) {
      setState(() {
        daftarObat.add(hasil);
      });
    }
  }

  void hapusObat(int index) {
    setState(() {
      daftarObat.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFF8),

      appBar: AppBar(title: const Text("💊 Pengingat Obat")),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: bukaTambahObat,
        icon: const Icon(Icons.add),
        label: const Text("Tambah"),
      ),

      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF66BB6A), Color(0xFF43A047)],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang 👋",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Jangan lupa minum obat tepat waktu.",
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),

          Expanded(
            child: daftarObat.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.medication_outlined,
                          size: 90,
                          color: Colors.grey,
                        ),

                        SizedBox(height: 15),

                        Text(
                          "Belum ada jadwal obat",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: daftarObat.length,
                    itemBuilder: (context, index) {
                      final obat = daftarObat[index];

                      return ObatCard(
                        obat: obat,
                        onDelete: () {
                          hapusObat(index);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
