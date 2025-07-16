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
  final List<String> timeRanges = ['1H', '24H', '7d', '1M', '6M'];

  @override
  Widget build(BuildContext context) {
    final assets = widget.isCrypto ? cryptos : stockIndexes;
    final category = widget.isCrypto ? 'Κρυπτονομίσματα' : 'Δείκτες';
    final screenHeight = MediaQuery.of(context).size.height;

    return SharedScaffold(
      title: 'Επιλογή $category',
      child: Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight - 120),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Επιλέξτε Asset:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: selectedAsset,
                    hint: Text(
                      'Επιλέξτε Asset',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                    dropdownColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.black),
                    items: assets.map((asset) {
                      return DropdownMenuItem<String>(
                        value: asset,
                        child: Text(asset),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => selectedAsset = value);
                    },
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      'Χρονικό Διάστημα:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: timeRanges
                        .map((range) => _buildIOSButton(range))
                        .toList(),
                  ),
                  const SizedBox(height: 30),
                  if (selectedAsset != null)
                    _buildIOSButton(
                      'Εμφάνιση Γραφήματος',
                      isFullWidth: true,
                      onTap: () {
                        // Εμφάνιση γραφήματος
                      },
                    ),
                  const SizedBox(height: 20),
                  if (selectedAsset != null)
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          '📈 Το γράφημα θα εμφανιστεί εδώ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIOSButton(
    String label, {
    bool isFullWidth = false,
    VoidCallback? onTap,
  }) {
    final bool isSelected = label == selectedRange;

    return SizedBox(
      width: isFullWidth ? double.infinity : 100,
      child: OutlinedButton(
        onPressed:
            onTap ??
            () {
              setState(() => selectedRange = label);
            },
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Colors.white : Colors.transparent,
          foregroundColor: isSelected ? Colors.black : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.2),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
