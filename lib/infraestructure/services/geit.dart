import 'package:coding_interview_frontend/infraestructure/datasources/orderbook.dart';
import 'package:coding_interview_frontend/infraestructure/repository/orderbook.dart';
import 'package:coding_interview_frontend/presentation/controllers/orderbook.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final OrderbookRepositoryImpl orderbookRepository = OrderbookRepositoryImpl(
  OrderbookDatasourceImpl(),
);

void setup() {
  getIt.registerSingleton<OrderbookController>(
    OrderbookController(orderbookRepository),
  );
}
