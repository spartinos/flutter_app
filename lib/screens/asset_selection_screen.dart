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
  String? selectedRange;
  bool showChart = false; // Έλεγχος εμφάνισης γραφήματος

  final List<String> stockIndexes = ['S&P500', 'NASDAQ', 'FTSE 100', 'DAX'];
  final List<String> cryptos = ['Bitcoin', 'Ethereum', 'Cardano', 'Solana'];
  final List<String> timeRanges = ['1H', '24H', '7d', '1M', '6M'];

  @override
  void initState() {
    super.initState();
    selectedRange = timeRanges.first;
  }

  @override
  Widget build(BuildContext context) {
    final assets = widget.isCrypto ? cryptos : stockIndexes;
    final category = widget.isCrypto ? 'Κρυπτονομίσματα' : 'Δείκτες';
    final screenHeight = MediaQuery.of(context).size.height;

    bool canShowChart = selectedAsset != null && selectedRange != null;

    return SharedScaffold(
      title: '$category',
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
                  Text(
                    'Επιλέξτε Asset:',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
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
                      setState(() {
                        selectedAsset = value;
                        showChart =
                            false; // reset εμφάνιση chart όταν αλλάζει το asset
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Χρονικό Διάστημα:',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  DropdownButtonFormField<String>(
                    value: selectedRange,
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
                    items: timeRanges.map((range) {
                      return DropdownMenuItem<String>(
                        value: range,
                        child: Text(range),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRange = value;
                        showChart =
                            false; // reset εμφάνιση chart όταν αλλάζει το range
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: canShowChart
                        ? () {
                            setState(() {
                              showChart = true;
                            });
                          }
                        : null,
                    child: Text('Εμφάνιση Γραφήματος'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  if (showChart)
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
                          '📈 Το γράφημα για το $selectedAsset με χρονικό διάστημα $selectedRange θα εμφανιστεί εδώ',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
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
}
