import 'package:flutter/material.dart';
import 'shared_scaffold.dart';
import 'asset_selection_screen.dart';

class CategorySelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SharedScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_graph, size: 70, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Επιλέξτε Κατηγορία',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 40),
            _buildCategoryButton(context, 'Δείκτες', Icons.bar_chart, false),
            SizedBox(height: 20),
            _buildCategoryButton(
              context,
              'Κρυπτονομίσματα',
              Icons.currency_bitcoin,
              true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
    BuildContext context,
    String label,
    IconData icon,
    bool isCrypto,
  ) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AssetSelectionScreen(isCrypto: isCrypto),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24),
            SizedBox(width: 12),
            Text(label, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
