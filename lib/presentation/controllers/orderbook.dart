import 'package:coding_interview_frontend/domain/entities/orderbook.dart';
import 'package:coding_interview_frontend/domain/repository/orderbook.dart';
import 'package:coding_interview_frontend/domain/value_objects/currency_fiat.dart';
import 'package:flutter/foundation.dart';

class OrderbookController extends ChangeNotifier {
  OrderbookRepository orderbookRepository;

  String selectedCryptoCurrency = 'USDT';
  String selectedFiatCurrency = 'VES';
  bool isCryptoToFiat = true;

  final currencies = [
    CurrencyFiat(
      name: 'USDT',
      subtitle: 'Tether (USDT)',
      code: 'USDT',
      image: 'assets/cripto_currencies/TATUM-TRON-USDT.png',
    ),
  ];

  final fiatCurrencies = [
    CurrencyFiat(
      name: 'VES',
      subtitle: 'Bolívar Soberano (VES)',
      code: 'VES',
      image: 'assets/fiat_currencies/VES.png',
    ),
    CurrencyFiat(
      name: 'BRL',
      subtitle: 'Real Brasileiro (R\$)',
      code: 'BRL',
      image: 'assets/fiat_currencies/BRL.png',
    ),
    CurrencyFiat(
      name: 'COP',
      subtitle: 'Peso Colombiano (COP)',
      code: 'COP',
      image: 'assets/fiat_currencies/COP.png',
    ),
    CurrencyFiat(
      name: 'PEN',
      subtitle: 'Sol Perú (PEN)',
      code: 'PEN',
      image: 'assets/fiat_currencies/PEN.png',
    ),
  ];

  String amount = '0.00';

  String type = '0';

  bool isLoading = false;

  OrderBook? _orderbook;

  OrderBook? get orderbook => _orderbook;

  OrderbookController(this.orderbookRepository);

  Future<OrderBook> getOrderbook({
    required String cryptoCurrencyId,
    required String fiatCurrencyId,
    required String amount,
    required String type,
    required String amountCurrencyId,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final orderbook = await orderbookRepository.getOrderbook(
        cryptoCurrencyId: cryptoCurrencyId,
        fiatCurrencyId: fiatCurrencyId,
        amount: amount,
        type: type,
        amountCurrencyId: amountCurrencyId,
      );

      _orderbook = orderbook;
      notifyListeners();

      return orderbook;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void reset() {
    _orderbook = null;
    notifyListeners();
  }

  get getIfIsCryptoToFiat {
    return isCryptoToFiat ? selectedCryptoCurrency : selectedFiatCurrency;
  }

  get getIfIsFiatToCrypto {
    return isCryptoToFiat ? selectedFiatCurrency : selectedCryptoCurrency;
  }
}
