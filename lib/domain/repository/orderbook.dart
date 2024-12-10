import 'package:coding_interview_frontend/domain/entities/orderbook.dart';

abstract class OrderbookRepository {
  Future<OrderBook> getOrderbook({
    required String cryptoCurrencyId,
    required String fiatCurrencyId,
    required String amount,
    required String type,
    required String amountCurrencyId,
  });
}
