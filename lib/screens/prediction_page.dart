import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';

class PredictionScreen extends StatelessWidget {
  final String index;
  final String range;

  const PredictionScreen({Key? key, required this.index, required this.range})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Αποτελέσματα Πρόβλεψης'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // ===== ΤΙΤΛΟΣ =====
            Center(
              child: Column(
                children: [
                  Text(
                    'Πρόβλεψη για $index',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '($range)',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),

            // ===== CHART =====
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.show_chart,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Γράφημα $index',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Χρονικό διάστημα: $range',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // ===== ΚΕΝΤΡΙΚΟΣ ΤΙΤΛΟΣ ΣΤΑΤΙΣΤΙΚΩΝ =====
            Center(
              child: Text(
                'Στατιστικά Μετρήσεις',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),

            // ===== ΣΤΑΤΙΣΤΙΚΑ =====
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.8,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: const [
                StatCard(label: "Τρέχουσα Τιμή", value: "\$4,180"),
                StatCard(label: "Πρόβλεψη Τιμής", value: "\$4,320"),
                StatCard(label: "Υψηλότερη Τιμή", value: "\$4,450"),
                StatCard(label: "Χαμηλότερη Τιμή", value: "\$4,120"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
