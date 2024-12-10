class OrderBook {
  final Offer byPrice;
  final Offer bySpeed;
  final Offer byReputation;

  const OrderBook({
    required this.byPrice,
    required this.bySpeed,
    required this.byReputation,
  });
}

class Offer {
  final String offerId;
  final User user;
  final int offerStatus;
  final int offerType;
  final DateTime createdAt;
  final String description;
  final String cryptoCurrencyId;
  final String fiatCurrencyId;
  final String maxLimit;
  final String minLimit;
  final String marketSize;
  final String availableSize;
  final Limits limits;
  final bool isDepleted;
  final String fiatToCryptoExchangeRate;
  final OfferMakerStats offerMakerStats;
  final List<String> paymentMethods;
  final String usdRate;
  final bool paused;
  final String userStatus;
  final String userLastSeen;
  final bool display;
  final String visibility;
  final List<dynamic> paymentMethodFilter;
  final bool orderRequestEnabled;

  const Offer({
    required this.offerId,
    required this.user,
    required this.offerStatus,
    required this.offerType,
    required this.createdAt,
    required this.description,
    required this.cryptoCurrencyId,
    required this.fiatCurrencyId,
    required this.maxLimit,
    required this.minLimit,
    required this.marketSize,
    required this.availableSize,
    required this.limits,
    required this.isDepleted,
    required this.fiatToCryptoExchangeRate,
    required this.offerMakerStats,
    required this.paymentMethods,
    required this.usdRate,
    required this.paused,
    required this.userStatus,
    required this.userLastSeen,
    required this.display,
    required this.visibility,
    required this.paymentMethodFilter,
    required this.orderRequestEnabled,
  });
}

class User {
  final String id;
  final String username;

  const User({
    required this.id,
    required this.username,
  });
}

class Limits {
  final CryptoFiatLimit crypto;
  final CryptoFiatLimit fiat;

  const Limits({
    required this.crypto,
    required this.fiat,
  });
}

class CryptoFiatLimit {
  final String maxLimit;
  final String minLimit;
  final String marketSize;
  final String availableSize;

  const CryptoFiatLimit({
    required this.maxLimit,
    required this.minLimit,
    required this.marketSize,
    required this.availableSize,
  });
}

class OfferMakerStats {
  final String userId;
  final double rating;
  final double userRating;
  final double releaseTime;
  final double payTime;
  final double responseTime;
  final int totalOffersCount;
  final int totalTransactionCount;
  final int marketMakerTransactionCount;
  final int marketTakerTransactionCount;

  const OfferMakerStats({
    required this.userId,
    required this.rating,
    required this.userRating,
    required this.releaseTime,
    required this.payTime,
    required this.responseTime,
    required this.totalOffersCount,
    required this.totalTransactionCount,
    required this.marketMakerTransactionCount,
    required this.marketTakerTransactionCount,
  });
}
