import 'package:flutter/material.dart';

class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  String? selectedBank;
  bool isBankSelected = true; // Untuk menentukan apakah Bank atau E-Wallet yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
        backgroundColor: Colors.green, // Warna hijau untuk AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kolom Saldo
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[100], // Warna hijau muda untuk latar belakang saldo
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.wallet, size: 50, color: Colors.green), // Ikon dengan warna hijau
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Saldo',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Rp 5.425.000', // Ganti dengan saldo aktual
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Nomor Rekening',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '7122xxxxx', // Ganti dengan nomor rekening aktual
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Kolom Pilihan Bank dan E-Wallet
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isBankSelected = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isBankSelected ? Colors.green : Colors.grey[300], // Hijau untuk Bank
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Bank',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isBankSelected = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: !isBankSelected ? Colors.green : Colors.grey[300], // Hijau untuk E-Wallet
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'E-Wallet',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Dropdown untuk Bank Tujuan
              Text(
                'Bank Tujuan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: selectedBank,
                hint: Text('Pilih Bank'),
                isExpanded: true,
                items: <String>['Bank BRI', 'Bank Mandiri', 'Bank Syariah Indonesia']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBank = newValue;
                  });
                },
              ),
              SizedBox(height: 20),

              // Kolom Input untuk Nomor Rekening, Nominal, dan Keterangan
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nomor Rekening',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nominal',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Keterangan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Tombol Selanjutnya
              Center(
                child: Container(
                  width: double.infinity, // Mengatur lebar penuh
                  height: 60, // Mengatur tinggi tombol
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol Selanjutnya ditekan
                    },
                    child: Text('Selanjutnya', style: TextStyle(fontSize: 20)), // Ukuran teks lebih besar
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Warna hijau untuk tombol
                      foregroundColor: Colors.white, // Warna teks tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Sudut tombol
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
