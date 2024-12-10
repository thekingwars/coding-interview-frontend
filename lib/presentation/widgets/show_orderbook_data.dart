import 'package:coding_interview_frontend/config/theme/theme.dart';
import 'package:coding_interview_frontend/presentation/controllers/orderbook.dart';
import 'package:flutter/material.dart';

class ShowOrderData extends StatelessWidget {
  const ShowOrderData({
    super.key,
    required this.orderbookController,
  });

  final OrderbookController orderbookController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: orderbookController,
      builder: (context, _) {
        final orderbook = orderbookController.orderbook;

        if (orderbook == null) return const SizedBox.shrink();

        if (orderbookController.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final price = orderbook.byPrice.fiatToCryptoExchangeRate;

        final amount = orderbookController.isCryptoToFiat
            ? double.parse(price) * double.parse(orderbookController.amount)
            : double.parse(orderbookController.amount) / double.parse(price);

        final amountCurrency = orderbookController.isCryptoToFiat
            ? orderbookController.selectedFiatCurrency
            : orderbookController.selectedCryptoCurrency;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tasa estimada',
                  style: AppTheme.infoLabelText,
                ),
                Text(
                  '≈ $price ${orderbookController.selectedFiatCurrency}',
                  style: AppTheme.infoValueText,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recibirás',
                  style: AppTheme.infoLabelText,
                ),
                Text(
                  '≈ ${amount.toStringAsFixed(2)} $amountCurrency',
                  style: AppTheme.infoValueText,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tiempo estimado',
                  style: AppTheme.infoLabelText,
                ),
                Text(
                  '≈ 10 Min',
                  style: AppTheme.infoValueText,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
