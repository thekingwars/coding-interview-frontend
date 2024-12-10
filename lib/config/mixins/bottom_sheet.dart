import 'package:coding_interview_frontend/domain/value_objects/currency_fiat.dart';
import 'package:flutter/material.dart';

mixin class BottomSheetMixin {
  Future<CurrencyFiat?> showCurrencySelector({
    required BuildContext context,
    required List<CurrencyFiat> items,
    required String selectedItem,
    required String title,
  }) {
    return showModalBottomSheet<CurrencyFiat>(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    onTap: () => Navigator.pop(context, item),
                    leading: Image.asset(
                      item.image,
                      width: 32,
                      height: 32,
                    ),
                    title: Text(
                      item.code,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      item.subtitle,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    trailing: Radio<String>(
                      value: item.code,
                      groupValue: selectedItem,
                      onChanged: (_) => Navigator.pop(context, item),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
