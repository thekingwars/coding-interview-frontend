import 'package:coding_interview_frontend/config/mixins/modal.dart';
import 'package:coding_interview_frontend/config/theme/theme.dart';
import 'package:coding_interview_frontend/infraestructure/services/geit.dart';
import 'package:coding_interview_frontend/presentation/controllers/orderbook.dart';
import 'package:coding_interview_frontend/presentation/widgets/currency_fiat_selector.dart';
import 'package:coding_interview_frontend/presentation/widgets/show_orderbook_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ModalMixin {
  late OrderbookController orderbookController;

  @override
  void initState() {
    super.initState();

    orderbookController = getIt<OrderbookController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20),
          decoration: AppTheme.cardDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CurrencyFiatSelector(
                orderbookController: orderbookController,
                onSwapCurrencies: () {
                  setState(() {
                    orderbookController.isCryptoToFiat =
                        !orderbookController.isCryptoToFiat;

                    orderbookController.type =
                        orderbookController.isCryptoToFiat ? '0' : '1';

                    orderbookController.reset();
                  });
                },
                onCurrencySelected: (result) {
                  setState(() {
                    if (orderbookController.isCryptoToFiat) {
                      orderbookController.selectedCryptoCurrency = result.code;
                    } else {
                      orderbookController.selectedFiatCurrency = result.code;
                    }
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                onChanged: (value) {
                  if (value.isEmpty) {
                    orderbookController.amount = '0.00';
                    return;
                  }

                  // Validar formato decimal
                  final isValidDecimal =
                      RegExp(r'^\d*\.?\d{0,2}$').hasMatch(value);
                  if (isValidDecimal) {
                    orderbookController.amount = value;
                  }
                },
                style: AppTheme.amountText,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          orderbookController.isCryptoToFiat
                              ? orderbookController.selectedCryptoCurrency
                              : orderbookController.selectedFiatCurrency,
                          style: AppTheme.inputText,
                        ),
                      ],
                    ),
                  ),
                  hintText: '0.00',
                  hintStyle: AppTheme.amountText,
                ),
                textAlign: TextAlign.left,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 16),
              ShowOrderData(orderbookController: orderbookController),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => orderbookController
                      .getOrderbook(
                    cryptoCurrencyId: 'TATUM-TRON-USDT',
                    fiatCurrencyId: orderbookController.selectedFiatCurrency,
                    amount: orderbookController.amount,
                    type: orderbookController.type,
                    amountCurrencyId: orderbookController.isCryptoToFiat
                        ? orderbookController.selectedCryptoCurrency
                        : orderbookController.selectedFiatCurrency,
                  )
                      .catchError((error) {
                    showErrorModal(
                      context: context,
                      message: 'Ha ocurrido un error',
                    );
                  }),
                  style: AppTheme.primaryButton,
                  child: const Text(
                    'Cambiar',
                    style: AppTheme.buttonText,
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
