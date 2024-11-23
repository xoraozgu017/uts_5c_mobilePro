import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.green, // Ubah warna AppBar menjadi hijau
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto Profil
              Center(
                child: CircleAvatar(
                  radius: 50, // Ukuran foto profil
                  backgroundImage: AssetImage('assets/image/profile.jpg'), // Ganti dengan URL foto profil
                ),
              ),
              SizedBox(height: 20),

              // Deskripsi Nama Nasabah
              Text(
                'Nama Nasabah',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green), // Teks hijau
              ),
              _buildProfileField('Nuroiniyatul Alimah'),

              SizedBox(height: 20),

              // Deskripsi Jenis Kelamin
              Text(
                'Jenis Kelamin',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green), // Teks hijau
              ),
              _buildProfileField('Perempuan'),

              SizedBox(height: 20),

              // Deskripsi Alamat
              Text(
                'Alamat',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green), // Teks hijau
              ),
              _buildProfileField('Dsn Banjarkerep Desa Banjardowo Jombang'),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk membangun kolom profil
  Widget _buildProfileField(String value) {
    return Container(
      padding: EdgeInsets.all(15), // Menambah padding untuk kolom
      width: double.infinity, // Memperpanjang kolom agar memenuhi lebar
      decoration: BoxDecoration(
        color: Colors.green[50], // Latar belakang hijau muda
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green), // Border hijau
      ),
      child: Text(
        value,
        style: TextStyle(fontSize: 16, color: Colors.green[700]), // Teks hijau gelap
      ),
    );
  }
}
