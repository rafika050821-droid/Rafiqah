import 'package:flutter/material.dart';
import '../models/obat.dart';

class TambahObat extends StatefulWidget {
  const TambahObat({super.key});

  @override
  State<TambahObat> createState() => _TambahObatState();
}

class _TambahObatState extends State<TambahObat> {
  final TextEditingController namaController = TextEditingController();
  TimeOfDay? jamDipilih;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFF5),

      appBar: AppBar(title: const Text("Tambah Jadwal")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8),
                ],
              ),

              child: TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.medication, color: Colors.green),
                  hintText: "Masukkan nama obat",
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.access_time),
                label: Text(
                  jamDipilih == null
                      ? "Pilih Jam"
                      : jamDipilih!.format(context),
                ),

                onPressed: () async {
                  TimeOfDay? waktu = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (waktu != null) {
                    setState(() {
                      jamDipilih = waktu;
                    });
                  }
                },
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle),
                label: const Text(
                  "Simpan Jadwal",
                  style: TextStyle(fontSize: 18),
                ),

                onPressed: () {
                  if (namaController.text.isEmpty || jamDipilih == null) {
                    return;
                  }

                  Navigator.pop(
                    context,
                    Obat(
                      namaObat: namaController.text,
                      jamMinum: jamDipilih!.format(context),
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
