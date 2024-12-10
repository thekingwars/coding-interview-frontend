import 'package:coding_interview_frontend/config/shared/constants/constants.dart';
import 'package:coding_interview_frontend/domain/datasource/orderbook.dart';
import 'package:coding_interview_frontend/domain/entities/orderbook.dart';
import 'package:coding_interview_frontend/infraestructure/mappers/orderbook.dart';
import 'package:coding_interview_frontend/infraestructure/models/orderbook.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderbookDatasourceImpl implements OrderbookDatasource {
  @override
  Future<OrderBook> getOrderbook({
    required String cryptoCurrencyId,
    required String fiatCurrencyId,
    required String amount,
    required String type,
    required String amountCurrencyId,
  }) async {
    final uri = Uri.https(
      ElDoradoConstants.apiUrl,
      '/stage/orderbook/public/recommendations',
      {
        'cryptoCurrencyId': cryptoCurrencyId,
        'fiatCurrencyId': fiatCurrencyId,
        'amount': amount,
        'type': type,
        'amountCurrencyId': amountCurrencyId,
      },
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load orderbook');
    }

    return OrderbookMapper.orderbookModelToEntity(
      OrderBookModel.fromJson(
        jsonDecode(response.body)['data'],
      ),
    );
  }
}
