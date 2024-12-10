import 'package:coding_interview_frontend/config/mixins/bottom_sheet.dart';
import 'package:coding_interview_frontend/config/theme/theme.dart';
import 'package:coding_interview_frontend/domain/value_objects/currency_fiat.dart';
import 'package:coding_interview_frontend/presentation/controllers/orderbook.dart';
import 'package:flutter/material.dart';

class CurrencyFiatSelector extends StatelessWidget with BottomSheetMixin {
  const CurrencyFiatSelector({
    super.key,
    required this.orderbookController,
    required this.onCurrencySelected,
    required this.onSwapCurrencies,
  });

  final OrderbookController orderbookController;
  final Function(CurrencyFiat) onCurrencySelected;
  final Function() onSwapCurrencies;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              decoration: AppTheme.currencySelectorDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final result = await showCurrencySelector(
                        title: orderbookController.isCryptoToFiat
                            ? 'Crypto'
                            : 'Fiat',
                        context: context,
                        items: orderbookController.isCryptoToFiat
                            ? orderbookController.currencies
                            : orderbookController.fiatCurrencies,
                        selectedItem: orderbookController.getIfIsCryptoToFiat,
                      );

                      if (result != null) {
                        onCurrencySelected(result);
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          orderbookController.isCryptoToFiat
                              ? 'assets/cripto_currencies/TATUM-TRON-USDT.png'
                              : 'assets/fiat_currencies/${orderbookController.selectedFiatCurrency}.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          orderbookController.isCryptoToFiat
                              ? orderbookController.selectedCryptoCurrency
                              : orderbookController.selectedFiatCurrency,
                          style: AppTheme.labelSmall,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppTheme.primary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () async {
                      final result = await showCurrencySelector(
                        title: orderbookController.isCryptoToFiat
                            ? 'Fiat'
                            : 'Crypto',
                        context: context,
                        items: orderbookController.isCryptoToFiat
                            ? orderbookController.fiatCurrencies
                            : orderbookController.currencies,
                        selectedItem: orderbookController.getIfIsFiatToCrypto,
                      );

                      if (result != null) {
                        onCurrencySelected(result);
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          orderbookController.isCryptoToFiat
                              ? 'assets/fiat_currencies/${orderbookController.selectedFiatCurrency}.png'
                              : 'assets/cripto_currencies/TATUM-TRON-USDT.png',
                          width: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          orderbookController.getIfIsFiatToCrypto,
                          style: AppTheme.labelSmall,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppTheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: -10,
          bottom: -10,
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton(
              onPressed: onSwapCurrencies,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                minimumSize: const Size(56, 56),
                shape: const CircleBorder(),
                backgroundColor: AppTheme.primary,
                elevation: 4,
                shadowColor: AppTheme.primary.withOpacity(0.4),
              ),
              child: const Icon(
                Icons.swap_horiz,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.white,
            child: const Text(
              'TENGO',
              style: AppTheme.labelSmall,
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.white,
            child: const Text(
              'QUIERO',
              style: AppTheme.labelSmall,
            ),
          ),
        ),
      ],
    );
  }
}
