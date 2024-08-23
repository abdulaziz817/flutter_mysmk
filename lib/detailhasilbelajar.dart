// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HasilBelajarMatematika extends StatefulWidget {
  @override
  _HasilBelajarMatematikaState createState() => _HasilBelajarMatematikaState();
}

class _HasilBelajarMatematikaState extends State<HasilBelajarMatematika> {
  final List<Map<String, dynamic>> _data = [
    {'name': 'Harian', 'nilai': 88, 'mulai': '07:00', 'selesai': '08:00', 'submit': '08:30', 'progres': '08:55', 'catatan': [
      'Untuk tugas harian ini, perlu perhatian khusus pada detail proses pengerjaan. Perhatikan cara penyelesaian setiap soal dengan seksama.',
    ]},
    {'name': 'Tugas', 'nilai': 85.0, 'mulai': '08:00', 'selesai': '09:00', 'submit': '09:30', 'progres': '09:55', 'catatan': [
      'Tugas ini memerlukan riset tambahan untuk menyelesaikan beberapa bagian yang lebih kompleks. Pastikan semua referensi digunakan dengan benar.',
    ]},
    {'name': 'PTS', 'nilai': 93.6, 'mulai': '07:30', 'selesai': '08:30', 'submit': '09:00', 'progres': '09:30', 'catatan': [
      'Persiapkan diri dengan baik untuk PTS dengan menyusun ringkasan materi. Gunakan waktu belajar secara efektif untuk meningkatkan pemahaman.',
    ]},
    {'name': 'UTS', 'nilai': 82, 'mulai': '08:00', 'selesai': '09:00', 'submit': '09:30', 'progres': '10:00', 'catatan': [
      'UTS kali ini memiliki fokus pada bab yang telah diajarkan selama semester ini. Pastikan untuk membaca semua materi terkait.',
    ]},
    {'name': 'UKK', 'nilai': 88.9, 'mulai': '08:30', 'selesai': '09:30', 'submit': '10:00', 'progres': '10:30', 'catatan': [
      'UKK memerlukan pemahaman yang mendalam terhadap konsep-konsep yang telah dipelajari sepanjang tahun. Review semua catatan dan latihan.',
    ]},
    {'name': 'UAS', 'nilai': 78.1, 'mulai': '09:00', 'selesai': '10:00', 'submit': '10:30', 'progres': '11:00', 'catatan': [
      'UAS adalah kesempatan untuk menunjukkan semua yang telah dipelajari selama tahun ajaran. Persiapkan dengan baik dan atur waktu belajar secara efektif.',
    ]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Hasil Belajar Matematika',
          style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.normal),
        ),
      ),
      body: Container(
        color: Color(0xFFF5F5F5), // Background sesuai dengan gambar
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: _data.length,
          itemBuilder: (context, index) {
            final item = _data[index];
            return _buildCard(
              context,
              item['name'],
              item['nilai'],
              item['mulai'],
              item['selesai'],
              item['submit'],
              item['progres'],
              item['catatan'],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String name,
    double nilai,
    String mulai,
    String selesai,
    String submit,
    String progres,
    List<String> catatan,
  ) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 16.0), // Margin untuk jarak antar card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'JENIS',
                style: GoogleFonts.roboto(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      nilai.toString(),
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Menit',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            name,
            style: GoogleFonts.poppins(
              color: Colors.green,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Container(
              width: double.infinity, // Full width
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  nilai.toStringAsFixed(1), // Nilai menggunakan koma
                  style: TextStyle(
                    fontSize: 130,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Roboto', // Font Roboto
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Text(
                  'Waktu',
                  style: GoogleFonts.roboto(
                    color: Colors.green,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTimeBox(mulai, 'Mulai'),
                    _buildTimeBox(selesai, 'Selesai'),
                    _buildTimeBox(submit, 'Submit'),
                    _buildTimeBox(progres, 'Progres'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Catatan',
                  style: GoogleFonts.roboto(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                ...catatan.map((note) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '• $note',
                    style: GoogleFonts.roboto(
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBox(String time, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            time,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.roboto(),
        ),
      ],
    );
  }
}
