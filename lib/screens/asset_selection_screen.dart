import 'package:flutter/material.dart';
import 'shared_scaffold.dart';

class AssetSelectionScreen extends StatefulWidget {
  final bool isCrypto;
  const AssetSelectionScreen({required this.isCrypto});

  @override
  _AssetSelectionScreenState createState() => _AssetSelectionScreenState();
}

class _AssetSelectionScreenState extends State<AssetSelectionScreen> {
  String? selectedAsset;
  String selectedRange = '1H';

  final List<String> stockIndexes = ['S&P500', 'NASDAQ', 'FTSE 100', 'DAX'];
  final List<String> cryptos = ['Bitcoin', 'Ethereum', 'Cardano', 'Solana'];
  final List<String> timeRanges = ['1H', '24H', '7d', '1M', '6M', '1Y'];

  @override
  Widget build(BuildContext context) {
    final assets = widget.isCrypto ? cryptos : stockIndexes;
    final category = widget.isCrypto ? 'Κρυπτονομίσματα' : 'Δείκτες';

    return SharedScaffold(
      title: 'Επιλογή $category',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            // 🔹 Μικρότερο ύψος για asset buttons ώστε να υπάρχει χώρος για τα υπόλοιπα
            Flexible(
              flex: 3,
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: assets.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (ctx, index) {
                  final asset = assets[index];
                  final isSelected = selectedAsset == asset;

                  return GestureDetector(
                    onTap: () => setState(() => selectedAsset = asset),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white.withOpacity(0.3)
                            : Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected
                              ? Colors.white
                              : Colors.white.withOpacity(0.2),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          asset,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Χρονικό Διάστημα
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Χρονικό Διάστημα:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 12),

            // 🔹 Χρονικά κουμπιά
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: timeRanges
                  .map((range) => _buildRangeChip(range))
                  .toList(),
            ),

            const SizedBox(height: 30),

            // 🔹 Προβολή Αποτελεσμάτων πιο ψηλά
            if (selectedAsset != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.white.withOpacity(0.3)),
                  ),
                ),
                onPressed: () => _showResults(context),
                child: const Text('Προβολή Αποτελεσμάτων'),
              ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildRangeChip(String range) {
    final isSelected = range == selectedRange;
    return ChoiceChip(
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Text(
          range,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      selected: isSelected,
      onSelected: (_) => setState(() => selectedRange = range),
      selectedColor: Colors.white,
      backgroundColor: Colors.white.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: isSelected ? Colors.black87 : Colors.grey.shade300,
          width: 1.2,
        ),
      ),
    );
  }

  void _showResults(BuildContext context) {
    // TODO: Σύνδεση με API ή μετάβαση σε νέα οθόνη
  }
}
