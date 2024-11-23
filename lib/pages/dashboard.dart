import 'package:flutter/material.dart';
import 'profile.dart';
import 'transaksi.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/image/profile.jpg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat datang',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Nuroiniyatul Alimah',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Kolom Saldo
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.wallet, size: 50, color: Colors.green), // Ikon hijau
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rp 5.425.000',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Nomor Rekening',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '7122xxxxx',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Akses Cepat
            Text(
              'Akses Cepat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: [
                _buildQuickAccessItem(Icons.send, 'Transfer', Colors.green, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TransaksiPage()));
                }),
                _buildQuickAccessItem(Icons.history, 'Aktivitas', Colors.green, () {}),
                _buildQuickAccessItem(Icons.account_balance, 'Akun Bank', Colors.green, () {}),
              ],
            ),
            SizedBox(height: 20),
            // Bagian Transaksi
            Text(
              'Transaksi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                TransactionItem(name: 'Nunung Faradhila', amount: 5000.000, type: 'Uang Masuk'),
                TransactionItem(name: 'Yunita Nur Fadhila', amount: 250.000, type: 'Uang Masuk'),
                TransactionItem(name: 'Ulfah Sakinah', amount: 50.000, type: 'Uang Masuk'),
                TransactionItem(name: 'Arma Monicha', amount: 125.000, type: 'Uang Masuk'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessItem(IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(height: 5),
              Text(label, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String name;
  final double amount;
  final String type;

  TransactionItem({required this.name, required this.amount, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(Icons.attach_money, size: 40, color: Colors.green), // Ikon hijau
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(type, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            SizedBox(width: 10),
            Text('Rp ${amount.toString()}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
