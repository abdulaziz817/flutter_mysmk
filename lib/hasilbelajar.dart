// ignore_for_file: prefer_const_constructors, sort_child_properties_last, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HasilBelajar extends StatefulWidget {
  @override
  _HasilBelajarState createState() => _HasilBelajarState();
}

class _HasilBelajarState extends State<HasilBelajar> {
  String? selectedTahunAjaran;
  String searchQuery = '';
  List<String> searchHistory = [];
  List<Map<String, dynamic>> mapelList = [
  {'name': 'Matematika', 'nilai': 80.3, 'tugas': 80.7, 'uts': 85.1, 'harian': 79.0, 'pts': 90.0},
  {'name': 'Figma', 'nilai': 95, 'tugas': 88, 'uts': 85, 'harian': 79, 'pts': 90},
  {'name': 'Fullstack \nDevelopment', 'nilai': 83.9, 'tugas': 80, 'uts': 85, 'harian': 79, 'pts': 90.0},
  {'name': 'Bahasa Indonesia', 'nilai': 88, 'tugas': 90, 'uts': 100, 'harian': 81.0, 'pts': 100},
  {'name': 'Pendidikan Kewarganegaraan', 'nilai': 85.0, 'tugas': 82, 'uts': 78.0, 'harian': 84, 'pts': 88.0},
  {'name': 'Aqidah', 'nilai': 90, 'tugas': 85, 'uts': 92.0, 'harian': 89, 'pts': 95},
  {'name': 'Tahfiz', 'nilai': 82.0, 'tugas': 80, 'uts': 79.0, 'harian': 81, 'pts': 85.0},
  {'name': 'Penjas', 'nilai': 88, 'tugas': 90.0, 'uts': 85, 'harian': 82.0, 'pts': 90},
  {'name': 'Hadits', 'nilai': 78.0, 'tugas': 75, 'uts': 80.0, 'harian': 77, 'pts': 85}
  ];
  List<Map<String, dynamic>> filteredMapelList = [];

  @override
  void initState() {
    super.initState();
    filteredMapelList = mapelList;
  }

  void filterMapel(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredMapelList = mapelList;
      } else {
        filteredMapelList = mapelList
            .where((mapel) =>
                mapel['name'].toLowerCase().startsWith(query.toLowerCase()))
            .toList();
        // Add query to search history
        if (!searchHistory.contains(query) && query.isNotEmpty) {
          searchHistory.add(query);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Hasil Belajar',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar and Dropdown for Tahun Ajaran
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      TextField(
                        onChanged: filterMapel,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Cari Mapel',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: selectedTahunAjaran,
                    decoration: InputDecoration(
                      hintText: 'Tahun Ajaran',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: <String>[
                      '2022-2023',
                      '2024-2025',
                      '2025-2026'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedTahunAjaran = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Main Content
            Expanded(
              child: filteredMapelList.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredMapelList.length,
                      itemBuilder: (context, index) {
                        final mapel = filteredMapelList[index];
                        return Center(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.only(bottom: 16.0),
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                // Mata Pelajaran dan Detail
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'JENIS',
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          mapel['name'],
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6.0, horizontal: 16.0),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Text(
                                        'Detail',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24),

                                // Widened Nilai Rata-Rata with Grey Background
                                Container(
                                  width: double.infinity, // Full width
                                  padding: EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200], // Grey background
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      mapel['nilai'].toStringAsFixed(1), // Menampilkan 1 angka di belakang koma
                                      style: TextStyle(
                                        fontSize: 130,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 18),

                                // Nilai Detail
                                Text(
                                  'Rata Nilai',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 33,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16),

                                // Wider boxes for detailed scores
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: nilaiBox(
                                          mapel['tugas'], 'Tugas'), // Passing as double
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: nilaiBox(
                                          mapel['uts'], 'UTS'), // Passing as double
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: nilaiBox(
                                          mapel['harian'], 'Harian'), // Passing as double
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: nilaiBox(
                                          mapel['pts'], 'PTS'), // Passing as double
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            
                            SizedBox(height: 16),
                            Text(
                              'Data tidak ditemukan',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget nilaiBox(double value, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            border: Border.all(color: Colors.grey), // Grey border
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value.toStringAsFixed(1), // Menampilkan 2 angka di belakang koma
            style: TextStyle(
              fontSize: 24, // Larger font for wider boxes
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
