import 'package:coding_interview_frontend/domain/datasource/orderbook.dart';
import 'package:coding_interview_frontend/domain/entities/orderbook.dart';
import 'package:coding_interview_frontend/domain/repository/orderbook.dart';

class OrderbookRepositoryImpl implements OrderbookRepository {
  final OrderbookDatasource _datasource;

  const OrderbookRepositoryImpl(this._datasource);

  @override
  Future<OrderBook> getOrderbook({
    required String cryptoCurrencyId,
    required String fiatCurrencyId,
    required String amount,
    required String type,
    required String amountCurrencyId,
  }) async {
    return _datasource.getOrderbook(
      cryptoCurrencyId: cryptoCurrencyId,
      fiatCurrencyId: fiatCurrencyId,
      amount: amount,
      type: type,
      amountCurrencyId: amountCurrencyId,
    );
  }
}
