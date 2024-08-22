// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HasilBelajarMatematika extends StatefulWidget {
  @override
  _HasilBelajarMatematikaState createState() => _HasilBelajarMatematikaState();
}

class _HasilBelajarMatematikaState extends State<HasilBelajarMatematika> {
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
          style: GoogleFonts.roboto(color: Colors.black),
        ),
      ),
      body: Container(
        color: Color(0xFFF5F5F5), // Background sesuai dengan gambar
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildCard(context),
            SizedBox(height: 16),
            _buildCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '30 Menit',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Text(
            'Harian',
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
                  '80,0', // Nilai menggunakan koma
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
          Text(
            'Waktu',
            style: GoogleFonts.roboto(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimeBox('07:00', 'Mulai'),
              _buildTimeBox('08:00', 'Selesai'),
              _buildTimeBox('08:30', 'submit'),
              _buildTimeBox('08:55', 'progres'),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Text(
              'Catatan: Sudah Cukup...Ayo Semangat Lagi',
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontStyle: FontStyle.italic,
              ),
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
