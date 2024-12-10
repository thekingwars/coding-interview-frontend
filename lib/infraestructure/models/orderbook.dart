class OrderBookModel {
  final OfferModel byPrice;
  final OfferModel bySpeed;
  final OfferModel byReputation;

  const OrderBookModel({
    required this.byPrice,
    required this.bySpeed,
    required this.byReputation,
  });

  factory OrderBookModel.fromJson(Map<String, dynamic> json) => OrderBookModel(
        byPrice: OfferModel.fromJson(json['byPrice']),
        bySpeed: OfferModel.fromJson(json['bySpeed']),
        byReputation: OfferModel.fromJson(json['byReputation']),
      );
}

class OfferModel {
  final String offerId;
  final UserModel user;
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
  final LimitsModel limits;
  final bool isDepleted;
  final String fiatToCryptoExchangeRate;
  final OfferMakerStatsModel offerMakerStats;
  final List<String> paymentMethods;
  final String usdRate;
  final bool paused;
  final String userStatus;
  final String userLastSeen;
  final bool display;
  final String visibility;
  final List<dynamic> paymentMethodFilter;
  final bool orderRequestEnabled;

  const OfferModel({
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

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        offerId: json['offerId'],
        user: UserModel.fromJson(json['user']),
        offerStatus: json['offerStatus'],
        offerType: json['offerType'],
        createdAt: DateTime.parse(json['createdAt']),
        description: json['description'],
        cryptoCurrencyId: json['cryptoCurrencyId'],
        fiatCurrencyId: json['fiatCurrencyId'],
        maxLimit: json['maxLimit'],
        minLimit: json['minLimit'],
        marketSize: json['marketSize'],
        availableSize: json['availableSize'],
        limits: LimitsModel.fromJson(json['limits']),
        isDepleted: json['isDepleted'],
        fiatToCryptoExchangeRate: json['fiatToCryptoExchangeRate'],
        offerMakerStats: OfferMakerStatsModel.fromJson(json['offerMakerStats']),
        paymentMethods: List<String>.from(json['paymentMethods']),
        usdRate: json['usdRate'],
        paused: json['paused'],
        userStatus: json['user_status'],
        userLastSeen: json['user_lastSeen'],
        display: json['display'],
        visibility: json['visibility'],
        paymentMethodFilter: json['paymentMethodFilter'],
        orderRequestEnabled: json['orderRequestEnabled'],
      );
}

class UserModel {
  final String id;
  final String username;

  const UserModel({
    required this.id,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        username: json['username'],
      );
}

class LimitsModel {
  final CryptoFiatLimitModel crypto;
  final CryptoFiatLimitModel fiat;

  const LimitsModel({
    required this.crypto,
    required this.fiat,
  });

  factory LimitsModel.fromJson(Map<String, dynamic> json) => LimitsModel(
        crypto: CryptoFiatLimitModel.fromJson(json['crypto']),
        fiat: CryptoFiatLimitModel.fromJson(json['fiat']),
      );
}

class CryptoFiatLimitModel {
  final String maxLimit;
  final String minLimit;
  final String marketSize;
  final String availableSize;

  const CryptoFiatLimitModel({
    required this.maxLimit,
    required this.minLimit,
    required this.marketSize,
    required this.availableSize,
  });

  factory CryptoFiatLimitModel.fromJson(Map<String, dynamic> json) =>
      CryptoFiatLimitModel(
        maxLimit: json['maxLimit'],
        minLimit: json['minLimit'],
        marketSize: json['marketSize'],
        availableSize: json['availableSize'],
      );
}

class OfferMakerStatsModel {
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

  const OfferMakerStatsModel({
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

  factory OfferMakerStatsModel.fromJson(Map<String, dynamic> json) =>
      OfferMakerStatsModel(
        userId: json['userId'],
        rating: json['rating'].toDouble(),
        userRating: json['userRating'].toDouble(),
        releaseTime: json['releaseTime'].toDouble(),
        payTime: json['payTime'].toDouble(),
        responseTime: json['responseTime'].toDouble(),
        totalOffersCount: json['totalOffersCount'],
        totalTransactionCount: json['totalTransactionCount'],
        marketMakerTransactionCount: json['marketMakerTransactionCount'],
        marketTakerTransactionCount: json['marketTakerTransactionCount'],
      );
}
