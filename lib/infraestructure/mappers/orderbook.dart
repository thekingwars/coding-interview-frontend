import 'package:coding_interview_frontend/domain/entities/orderbook.dart';
import 'package:coding_interview_frontend/infraestructure/models/orderbook.dart';

class OrderbookMapper {
  static OrderBook orderbookModelToEntity(OrderBookModel orderbookModel) {
    return OrderBook(
      byPrice: _mapOffer(orderbookModel.byPrice),
      bySpeed: _mapOffer(orderbookModel.bySpeed),
      byReputation: _mapOffer(orderbookModel.byReputation),
    );
  }

  static Offer _mapOffer(OfferModel model) {
    return Offer(
      offerId: model.offerId,
      user: User(id: model.user.id, username: model.user.username),
      offerStatus: model.offerStatus,
      offerType: model.offerType,
      createdAt: model.createdAt,
      description: model.description,
      cryptoCurrencyId: model.cryptoCurrencyId,
      fiatCurrencyId: model.fiatCurrencyId,
      maxLimit: model.maxLimit,
      minLimit: model.minLimit,
      marketSize: model.marketSize,
      availableSize: model.availableSize,
      limits: _mapLimits(model.limits),
      isDepleted: model.isDepleted,
      fiatToCryptoExchangeRate: model.fiatToCryptoExchangeRate,
      offerMakerStats: _mapOfferMakerStats(model.offerMakerStats),
      paymentMethods: model.paymentMethods,
      usdRate: model.usdRate,
      paused: model.paused,
      userStatus: model.userStatus,
      userLastSeen: model.userLastSeen,
      display: model.display,
      visibility: model.visibility,
      paymentMethodFilter: model.paymentMethodFilter,
      orderRequestEnabled: model.orderRequestEnabled,
    );
  }

  static Limits _mapLimits(LimitsModel model) {
    return Limits(
      crypto: _mapCryptoFiatLimit(model.crypto),
      fiat: _mapCryptoFiatLimit(model.fiat),
    );
  }

  static CryptoFiatLimit _mapCryptoFiatLimit(CryptoFiatLimitModel model) {
    return CryptoFiatLimit(
      maxLimit: model.maxLimit,
      minLimit: model.minLimit,
      marketSize: model.marketSize,
      availableSize: model.availableSize,
    );
  }

  static OfferMakerStats _mapOfferMakerStats(OfferMakerStatsModel model) {
    return OfferMakerStats(
      userId: model.userId,
      rating: model.rating,
      userRating: model.userRating,
      releaseTime: model.releaseTime,
      payTime: model.payTime,
      responseTime: model.responseTime,
      totalOffersCount: model.totalOffersCount,
      totalTransactionCount: model.totalTransactionCount,
      marketMakerTransactionCount: model.marketMakerTransactionCount,
      marketTakerTransactionCount: model.marketTakerTransactionCount,
    );
  }
}
