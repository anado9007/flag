part of 'central.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object> get props => [message, statusCode];
}

class APIFailure extends Failure {
  const APIFailure({required super.message, required super.statusCode});

  APIFailure.fromException(APIException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class APIException extends Equatable implements Exception {
  const APIException({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class LastQuote {
  final String symbol;
  final double ask;
  final double bid;
  final int timestamp;

  LastQuote({
    required this.symbol,
    required this.ask,
    required this.bid,
    required this.timestamp,
  });

  LastQuote copyWith({
    String? symbol,
    double? ask,
    double? bid,
    int? timestamp,
  }) =>
      LastQuote(
        symbol: symbol ?? this.symbol,
        ask: ask ?? this.ask,
        bid: bid ?? this.bid,
        timestamp: timestamp ?? this.timestamp,
      );

  factory LastQuote.fromJson(String str) => LastQuote.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LastQuote.fromMap(Map<String, dynamic> json) => LastQuote(
        symbol: json["symbol"],
        ask: json["ask"]?.toDouble(),
        bid: json["bid"]?.toDouble(),
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "symbol": symbol,
        "ask": ask,
        "bid": bid,
        "timestamp": timestamp,
      };
}

class GetLastQuote extends UsecaseWithParams<LastQuote, GetLastQuoteParams> {
  const GetLastQuote(this._repository);

  final LastQuoteRepository _repository;

  @override
  ResultFuture<LastQuote> call(GetLastQuoteParams params) async {
    return _repository.getLastQuote(
        symbol: params.symbol, apikey: params.apikey);
  }
}

class GetLastQuoteParams extends Equatable {
  const GetLastQuoteParams({required this.symbol, required this.apikey});

  const GetLastQuoteParams.empty()
      : this(symbol: '_empty.symbol', apikey: '_empty.apikey');

  final String symbol;
  final String apikey;

  @override
  List<Object?> get props => [symbol, apikey];
}

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  ResultFuture<Type> call();
}

abstract class LastQuoteRepository {
  const LastQuoteRepository();

  ResultFuture<LastQuote> getLastQuote(
      {required String symbol, required String apikey});
}

class AOrder {
  final String id;
  final String type;
  final String state;
  final String symbol;
  final int magic;
  final DateTime time;
  final DateTime brokerTime;
  final String platform;
  final double openPrice;
  final double currentPrice;
  final double volume;
  final double currentVolume;

  AOrder({
    required this.id,
    required this.type,
    required this.state,
    required this.symbol,
    required this.magic,
    required this.time,
    required this.brokerTime,
    required this.platform,
    required this.openPrice,
    required this.currentPrice,
    required this.volume,
    required this.currentVolume,
  });

  AOrder copyWith({
    String? id,
    String? type,
    String? state,
    String? symbol,
    int? magic,
    DateTime? time,
    DateTime? brokerTime,
    String? platform,
    double? openPrice,
    double? currentPrice,
    double? volume,
    double? currentVolume,
  }) =>
      AOrder(
        id: id ?? this.id,
        type: type ?? this.type,
        state: state ?? this.state,
        symbol: symbol ?? this.symbol,
        magic: magic ?? this.magic,
        time: time ?? this.time,
        brokerTime: brokerTime ?? this.brokerTime,
        platform: platform ?? this.platform,
        openPrice: openPrice ?? this.openPrice,
        currentPrice: currentPrice ?? this.currentPrice,
        volume: volume ?? this.volume,
        currentVolume: currentVolume ?? this.currentVolume,
      );

  factory AOrder.fromJson(String str) => AOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AOrder.fromMap(Map<String, dynamic> json) => AOrder(
        id: json["id"],
        type: json["type"],
        state: json["state"],
        symbol: json["symbol"],
        magic: json["magic"],
        time: DateTime.parse(json["time"]),
        brokerTime: DateTime.parse(json["brokerTime"]),
        platform: json["platform"],
        openPrice: json["openPrice"]?.toDouble(),
        currentPrice: json["currentPrice"]?.toDouble(),
        volume: json["volume"]?.toDouble(),
        currentVolume: json["currentVolume"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "state": state,
        "symbol": symbol,
        "magic": magic,
        "time": time.toIso8601String(),
        "brokerTime": brokerTime.toIso8601String(),
        "platform": platform,
        "openPrice": openPrice,
        "currentPrice": currentPrice,
        "volume": volume,
        "currentVolume": currentVolume,
      };
}

class Position {
  final String id;
  final String platform;
  final String type;
  final String symbol;
  final num magic;
  final DateTime time;
  final DateTime brokerTime;
  final DateTime updateTime;
  final num openPrice;
  final num volume;
  final num swap;
  final num commission;
  final num realizedSwap;
  final num realizedCommission;
  final num unrealizedSwap;
  final num unrealizedCommission;
  final String reason;
  final num currentPrice;
  final num currentTickValue;
  final num realizedProfit;
  final num unrealizedProfit;
  final num profit;
  final num accountCurrencyExchangeRate;
  final num updateSequenceNumber;

  Position({
    required this.id,
    required this.platform,
    required this.type,
    required this.symbol,
    required this.magic,
    required this.time,
    required this.brokerTime,
    required this.updateTime,
    required this.openPrice,
    required this.volume,
    required this.swap,
    required this.commission,
    required this.realizedSwap,
    required this.realizedCommission,
    required this.unrealizedSwap,
    required this.unrealizedCommission,
    required this.reason,
    required this.currentPrice,
    required this.currentTickValue,
    required this.realizedProfit,
    required this.unrealizedProfit,
    required this.profit,
    required this.accountCurrencyExchangeRate,
    required this.updateSequenceNumber,
  });

  Position copyWith({
    String? id,
    String? platform,
    String? type,
    String? symbol,
    int? magic,
    DateTime? time,
    DateTime? brokerTime,
    DateTime? updateTime,
    double? openPrice,
    double? volume,
    int? swap,
    int? commission,
    int? realizedSwap,
    int? realizedCommission,
    int? unrealizedSwap,
    int? unrealizedCommission,
    String? reason,
    double? currentPrice,
    int? currentTickValue,
    int? realizedProfit,
    double? unrealizedProfit,
    double? profit,
    int? accountCurrencyExchangeRate,
    int? updateSequenceNumber,
  }) =>
      Position(
        id: id ?? this.id,
        platform: platform ?? this.platform,
        type: type ?? this.type,
        symbol: symbol ?? this.symbol,
        magic: magic ?? this.magic,
        time: time ?? this.time,
        brokerTime: brokerTime ?? this.brokerTime,
        updateTime: updateTime ?? this.updateTime,
        openPrice: openPrice ?? this.openPrice,
        volume: volume ?? this.volume,
        swap: swap ?? this.swap,
        commission: commission ?? this.commission,
        realizedSwap: realizedSwap ?? this.realizedSwap,
        realizedCommission: realizedCommission ?? this.realizedCommission,
        unrealizedSwap: unrealizedSwap ?? this.unrealizedSwap,
        unrealizedCommission: unrealizedCommission ?? this.unrealizedCommission,
        reason: reason ?? this.reason,
        currentPrice: currentPrice ?? this.currentPrice,
        currentTickValue: currentTickValue ?? this.currentTickValue,
        realizedProfit: realizedProfit ?? this.realizedProfit,
        unrealizedProfit: unrealizedProfit ?? this.unrealizedProfit,
        profit: profit ?? this.profit,
        accountCurrencyExchangeRate:
            accountCurrencyExchangeRate ?? this.accountCurrencyExchangeRate,
        updateSequenceNumber: updateSequenceNumber ?? this.updateSequenceNumber,
      );

  factory Position.fromJson(String str) => Position.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Position.fromMap(Map<String, dynamic> json) => Position(
        id: json["id"],
        platform: json["platform"],
        type: json["type"],
        symbol: json["symbol"],
        magic: json["magic"],
        time: DateTime.parse(json["time"]),
        brokerTime: DateTime.parse(json["brokerTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
        openPrice: json["openPrice"]?.toDouble(),
        volume: json["volume"]?.toDouble(),
        swap: json["swap"],
        commission: json["commission"],
        realizedSwap: json["realizedSwap"],
        realizedCommission: json["realizedCommission"],
        unrealizedSwap: json["unrealizedSwap"],
        unrealizedCommission: json["unrealizedCommission"],
        reason: json["reason"],
        currentPrice: json["currentPrice"]?.toDouble(),
        currentTickValue: json["currentTickValue"],
        realizedProfit: json["realizedProfit"],
        unrealizedProfit: json["unrealizedProfit"]?.toDouble(),
        profit: json["profit"]?.toDouble(),
        accountCurrencyExchangeRate: json["accountCurrencyExchangeRate"],
        updateSequenceNumber: json["updateSequenceNumber"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "platform": platform,
        "type": type,
        "symbol": symbol,
        "magic": magic,
        "time": time.toIso8601String(),
        "brokerTime": brokerTime.toIso8601String(),
        "updateTime": updateTime.toIso8601String(),
        "openPrice": openPrice,
        "volume": volume,
        "swap": swap,
        "commission": commission,
        "realizedSwap": realizedSwap,
        "realizedCommission": realizedCommission,
        "unrealizedSwap": unrealizedSwap,
        "unrealizedCommission": unrealizedCommission,
        "reason": reason,
        "currentPrice": currentPrice,
        "currentTickValue": currentTickValue,
        "realizedProfit": realizedProfit,
        "unrealizedProfit": unrealizedProfit,
        "profit": profit,
        "accountCurrencyExchangeRate": accountCurrencyExchangeRate,
        "updateSequenceNumber": updateSequenceNumber,
      };
}

class DeleteATrade extends UsecaseWithParams<DeleteTrade, DeleteATradeParams> {
  const DeleteATrade(this._repository);

  final MetaApiRepository _repository;

  @override
  ResultFuture<DeleteTrade> call(DeleteATradeParams params) async =>
      _repository.deleteATrade(
          positionOrOrderId: params.positionOrOrderId, account: params.account);
}

class DeleteATradeParams extends Equatable {
  const DeleteATradeParams(
      {required this.positionOrOrderId, required this.account});

  const DeleteATradeParams.empty()
      : this(
            positionOrOrderId: '_empty.positionOrOderId',
            account: '_empty.account');

  final String positionOrOrderId;
  final String account;

  @override
  List<Object?> get props => [positionOrOrderId, account];
}

class DeleteTrade {
  final int numericCode;
  final String stringCode;
  final String message;
  final String orderId;
  String? positionId;

  DeleteTrade({
    required this.numericCode,
    required this.stringCode,
    required this.message,
    required this.orderId,
    this.positionId,
  });

  factory DeleteTrade.fromJson(String str) =>
      DeleteTrade.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteTrade.fromMap(Map<String, dynamic> json) => DeleteTrade(
        numericCode: json["numericCode"],
        stringCode: json["stringCode"],
        message: json["message"],
        orderId: json["orderId"],
        positionId: json["positionId"],
      );

  Map<String, dynamic> toMap() => {
        "numericCode": numericCode,
        "stringCode": stringCode,
        "message": message,
        "orderId": orderId,
        "positionId": positionId,
      };
}

abstract class MetaApiRepository {
  const MetaApiRepository();

  ResultFuture<AccountInformation> getAccountInformation(
      {required String account});

  ResultFuture<OrderTrade> placeOrder(
      {required String actionType,
      required String symbol,
      required double volume,
      required double openPrice,
      required double stopLoss,
      required double takeProfit,
      required String account});

  ResultFuture<DeleteTrade> deleteATrade(
      {required String positionOrOrderId, required String account});

  ResultFuture<List<Position>> getAllPositions({required String account});

  ResultFuture<Position> getPosition(
      {required String positionId, required String account});

  ResultFuture<ModifyPosition> doModifyPosition(
      {required String positionId,
      required double takeProfit,
      required String account});

  ResultFuture<List<AOrder>> getAllOrders({required String account});
}

class AccountInformation {
  final String platform;
  final String type;
  final String broker;
  final String currency;
  final String server;
  final num balance;
  final num equity;
  final num margin;
  final num freeMargin;
  final num leverage;
  final bool tradeAllowed;
  final bool investorMode;
  final String marginMode;
  final String name;
  final num login;
  final num credit;

  AccountInformation({
    required this.platform,
    required this.type,
    required this.broker,
    required this.currency,
    required this.server,
    required this.balance,
    required this.equity,
    required this.margin,
    required this.freeMargin,
    required this.leverage,
    required this.tradeAllowed,
    required this.investorMode,
    required this.marginMode,
    required this.name,
    required this.login,
    required this.credit,
  });

  AccountInformation copyWith({
    String? platform,
    String? type,
    String? broker,
    String? currency,
    String? server,
    num? balance,
    num? equity,
    num? margin,
    num? freeMargin,
    num? leverage,
    bool? tradeAllowed,
    bool? investorMode,
    String? marginMode,
    String? name,
    num? login,
    num? credit,
  }) =>
      AccountInformation(
        platform: platform ?? this.platform,
        type: type ?? this.type,
        broker: broker ?? this.broker,
        currency: currency ?? this.currency,
        server: server ?? this.server,
        balance: balance ?? this.balance,
        equity: equity ?? this.equity,
        margin: margin ?? this.margin,
        freeMargin: freeMargin ?? this.freeMargin,
        leverage: leverage ?? this.leverage,
        tradeAllowed: tradeAllowed ?? this.tradeAllowed,
        investorMode: investorMode ?? this.investorMode,
        marginMode: marginMode ?? this.marginMode,
        name: name ?? this.name,
        login: login ?? this.login,
        credit: credit ?? this.credit,
      );

  factory AccountInformation.fromJson(String str) =>
      AccountInformation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountInformation.fromMap(Map<String, dynamic> json) =>
      AccountInformation(
        platform: json["platform"],
        type: json["type"],
        broker: json["broker"],
        currency: json["currency"],
        server: json["server"],
        balance: json["balance"]?.toDouble(),
        equity: json["equity"]?.toDouble(),
        margin: json["margin"],
        freeMargin: json["freeMargin"]?.toDouble(),
        leverage: json["leverage"],
        tradeAllowed: json["tradeAllowed"],
        investorMode: json["investorMode"],
        marginMode: json["marginMode"],
        name: json["name"],
        login: json["login"],
        credit: json["credit"],
      );

  Map<String, dynamic> toMap() => {
        "platform": platform,
        "type": type,
        "broker": broker,
        "currency": currency,
        "server": server,
        "balance": balance,
        "equity": equity,
        "margin": margin,
        "freeMargin": freeMargin,
        "leverage": leverage,
        "tradeAllowed": tradeAllowed,
        "investorMode": investorMode,
        "marginMode": marginMode,
        "name": name,
        "login": login,
        "credit": credit,
      };
}

class ModifyPosition {
  final num numericCode;
  final String stringCode;
  final String message;
  final String positionId;

  ModifyPosition({
    required this.numericCode,
    required this.stringCode,
    required this.message,
    required this.positionId,
  });

  ModifyPosition copyWith({
    num? numericCode,
    String? stringCode,
    String? message,
    String? positionId,
  }) =>
      ModifyPosition(
        numericCode: numericCode ?? this.numericCode,
        stringCode: stringCode ?? this.stringCode,
        message: message ?? this.message,
        positionId: positionId ?? this.positionId,
      );

  factory ModifyPosition.fromJson(String str) =>
      ModifyPosition.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModifyPosition.fromMap(Map<String, dynamic> json) => ModifyPosition(
        numericCode: json["numericCode"],
        stringCode: json["stringCode"],
        message: json["message"],
        positionId: json["positionId"],
      );

  Map<String, dynamic> toMap() => {
        "numericCode": numericCode,
        "stringCode": stringCode,
        "message": message,
        "positionId": positionId,
      };
}

class OrderTrade {
  final int numericCode;
  final String stringCode;
  final String message;
  final String orderId;
  final String? positionId;
  final DateTime tradeExecutionTime;
  final DateTime tradeStartTime;

  OrderTrade({
    required this.numericCode,
    required this.stringCode,
    required this.message,
    required this.orderId,
    this.positionId,
    required this.tradeExecutionTime,
    required this.tradeStartTime,
  });

  factory OrderTrade.fromJson(String str) =>
      OrderTrade.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderTrade.fromMap(Map<String, dynamic> json) => OrderTrade(
        numericCode: json["numericCode"],
        stringCode: json["stringCode"],
        message: json["message"],
        orderId: json["orderId"],
        positionId: json["positionId"],
        tradeExecutionTime: DateTime.parse(json["tradeExecutionTime"]),
        tradeStartTime: DateTime.parse(json["tradeStartTime"]),
      );

  Map<String, dynamic> toMap() => {
        "numericCode": numericCode,
        "stringCode": stringCode,
        "message": message,
        "orderId": orderId,
        "positionId": positionId,
        "tradeExecutionTime": tradeExecutionTime.toIso8601String(),
        "tradeStartTime": tradeStartTime.toIso8601String(),
      };
}

class GetAccountInformation
    extends UsecaseWithParams<AccountInformation, GetAccountInformationParams> {
  const GetAccountInformation(this._repository);

  final MetaApiRepository _repository;

  @override
  ResultFuture<AccountInformation> call(
          GetAccountInformationParams params) async =>
      _repository.getAccountInformation(account: params.account);
}

class GetAccountInformationParams extends Equatable {
  const GetAccountInformationParams({required this.account});

  const GetAccountInformationParams.empty() : this(account: '_empty.account');

  final String account;

  @override
  List<Object?> get props => [account];
}

class GetAllOrder extends UsecaseWithParams<List<AOrder>, GetAllOrderParams> {
  const GetAllOrder(this._repository);

  final MetaApiRepository _repository;

  @override
  ResultFuture<List<AOrder>> call(GetAllOrderParams params) async =>
      _repository.getAllOrders(account: params.account);
}

class GetAllOrderParams extends Equatable {
  const GetAllOrderParams({required this.account});

  const GetAllOrderParams.empty() : this(account: '_empty.account');

  final String account;

  @override
  List<Object?> get props => [account];
}

class GetAllPosition
    extends UsecaseWithParams<List<Position>, GetAllPositionParams> {
  const GetAllPosition(this._repository);

  final MetaApiRepository _repository;

  @override
  ResultFuture<List<Position>> call(GetAllPositionParams params) async =>
      _repository.getAllPositions(account: params.account);
}

class GetAllPositionParams extends Equatable {
  const GetAllPositionParams({required this.account});

  const GetAllPositionParams.empty() : this(account: '_empty.account');

  final String account;

  @override
  List<Object?> get props => [account];
}

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class LoadingData extends HomeState {
  const LoadingData();
}

// class TwelveDataCreated extends HomeState {
//   const TwelveDataCreated();
// }

// class TwelveDataLoaded extends HomeState {
//   const TwelveDataLoaded(this.twelveData);

//   final TwelveData twelveData;

//   @override
//   //List<Object> get props => twelveData.map((data) => data.id).toList();
//   List<Object> get props => [];
// }

class HomeError extends HomeState {
  const HomeError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}

class HomeSucess extends HomeState {
  const HomeSucess({required this.orderType, required this.symbol});
  final String orderType;
  final String symbol;

  @override
  List<Object> get props => [orderType, symbol];
}

class PositionsLoaded extends HomeState {
  const PositionsLoaded(this.positions);

  final List<Position> positions;

  @override
  List<Object> get props => positions.map((user) => user.id).toList();
}

class ModifiedPosition extends HomeState {
  const ModifiedPosition(
      {required this.positions,
      required this.currentPosition,
      required this.currentCharge});

  final List<Position> positions;
  final Position currentPosition;
  final double currentCharge;

  @override
  List<Object> get props => positions.map((user) => user.id).toList();
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetFirstQuote getFirstQuote,
    required GetLastQuote getLastQuote,
    required GetTwelveData getTwelveData,
    required GetAccountInformation getAccountInformation,
    required PlaceOrder placeOrder,
    required DeleteATrade deleteATrade,
    required GetAllPosition getAllPosition,
    required GetPosition getPosition,
    required DoModifyPosition doModifyPosition,
    required GetAllOrder getAllOrder,
  })  : _getFirstQuote = getFirstQuote,
        _getLastQuote = getLastQuote,
        _getTwelveData = getTwelveData,
        _getAccountInformation = getAccountInformation,
        _placeOrder = placeOrder,
        _deleteATrade = deleteATrade,
        _getAllPosition = getAllPosition,
        _getPosition = getPosition,
        _doModifyPosition = doModifyPosition,
        _getAllOrder = getAllOrder,
        super(const HomeInitial());

  final GetFirstQuote _getFirstQuote; // value not to be used
  final GetLastQuote _getLastQuote; // value not to be used
  final GetTwelveData _getTwelveData;
  final GetAccountInformation _getAccountInformation;
  final PlaceOrder _placeOrder;
  final DeleteATrade _deleteATrade;
  final GetAllPosition _getAllPosition;
  final GetPosition _getPosition; // value not to be used
  final DoModifyPosition _doModifyPosition;
  final GetAllOrder _getAllOrder;

//GLOBAL VARIABLE
  int countPosition = riskNumberActiveTrades;

// ********************______________---------------********************
  /// get values code in this section.

  /// price * balancer = constant
  double constant = 100000; // we could use any number as aconstant

  int totalInForexList = 0;
// global pairs
  final List<String> _forexSymbolOne = <String>[
    'EUR/USD' // 0.13
    ,
    'GBP/USD' // 0.15
    ,
    'USD/CHF' // 0.26
    ,
    'USD/JPY' // 0.23
  ];

  final Map<String, double> _forexFees = {
    "EURUSD": 0.13,
    "GBPUSD": 0.21,
    "USDCHF": 0.26,
    "USDJPY": 0.23,
  };

  final Map<String, double> _forexTakeProfit = {
    // "EURUSD": 0.13,
    // "GBPUSD": 0.15,
    // "USDCHF": 0.26,
    // "USDJPY": 0.23,
  };

  double exitProfit = 0.01;
  double clearProfit = 0.0;

  /// This is the method to triger everything.
  Future<void> startTrading() async {
    totalInForexList = 0;
    List<Forex> forexList = <Forex>[];
    // first retrive data about account information
    emit(const LoadingData());

    await _collectPrimaryData(
        authorization: 'apikey $kTwelveDataApiKeyOne',
        list: _forexSymbolOne,
        listFunc: ({required Forex forex}) {
          forexList.add(forex);
        });
    if (forexList.isNotEmpty) {
      await _operation(forexList: forexList);
    } else {
      await _makeTrade(
          actionType: "ORDER_TYPE_SELL",
          symbolMetaApiLive: 'EURUSD.Z',
          volume: null,
          account: 'LIVE');

      await _makeTrade(
          actionType: "ORDER_TYPE_BUY",
          symbolMetaApiLive: 'EURUSD.Z',
          volume: null,
          account: 'LIVE');
    }

    totalInForexList = forexList.length;

    countPosition = riskNumberActiveTrades;
  }

  Future<void> _collectPrimaryData(
      {required String authorization,
      required List list,
      required Function listFunc}) async {
    for (var symbol in list) {
      emit(const LoadingData());
      final result = await _getTwelveData(
          GetTwelveDataParams(symbol: symbol, authorization: authorization));

      result.fold(
        (failure) {
          emit(HomeError(failure.errorMessage));
        },
        (data) {
          var open = double.parse(data.values[0].open);
          var close = double.parse(data.values[0].close);
          // Do calculation to trade
          emit(const LoadingData());
          listFunc(
              forex: Forex(
                  name: symbol,
                  compare: close * constant / open,
                  exchangeRate: close));
        },
      );
    }
  }

  Future<void> _operation({required List<Forex> forexList}) async {
    List<Forex> positiveForexList = <Forex>[];

    for (var element in forexList) {
      double compare = element.compare;

      if (compare < 0) {
        compare = compare * -1;
      }

      Forex forex = Forex(
          name: element.name,
          compare: compare,
          exchangeRate: element.exchangeRate);

      positiveForexList.add(forex);
    }

    positiveForexList.sort((a, b) {
      var aCompare = a.compare;
      var bCompare = b.compare;
      return bCompare.compareTo(aCompare);
    });

    for (var i = 0; i < 1; i++) {
      //TODO alteration
      await _makeTrade(
          actionType: "ORDER_TYPE_SELL",
          symbolMetaApiLive: _convertTwelveDataToMetaApiLive(
              symbolMetaApiDemo: positiveForexList[i].name),
          volume: null,
          account: 'LIVE');

      await _makeTrade(
          actionType: "ORDER_TYPE_BUY",
          symbolMetaApiLive: _convertTwelveDataToMetaApiLive(
              symbolMetaApiDemo: positiveForexList[i].name),
          volume: null,
          account: 'LIVE');
    }
  }

  String _convertTwelveDataToFinageSymbol({required String symbolTwelveData}) {
    String finageSymbol = '';
    String baseCurrency = '';
    String quoteCurrency = '';

    for (var i = 0; i < 3; i++) {
      baseCurrency = baseCurrency + symbolTwelveData[i];
      quoteCurrency = quoteCurrency + symbolTwelveData[i + 4];
    }
    print('convertTwelveDataToFinageSymbol is $baseCurrency$quoteCurrency');
    finageSymbol = '$baseCurrency$quoteCurrency';

    return finageSymbol;
  }

// placing in and out
  Future<void> _makeTrade(
      {required String actionType,
      String? symbolTwelveData,
      String? symbolMetaApiDemo,
      String? symbolMetaApiLive,
      double? volume,
      required String account}) async {
    emit(const LoadingData());

    String symbol = '';
    if (symbolTwelveData != null) {
      symbol =
          _convertTwelveDataToFinageSymbol(symbolTwelveData: symbolTwelveData);
    } else if (symbolMetaApiDemo != null) {
      symbol =
          _convertTwelveDataToMetaApiLive(symbolMetaApiDemo: symbolMetaApiDemo);
    } else if (symbolMetaApiLive != null) {
      symbol = symbolMetaApiLive;
    }

    var value = 0;
    await Future.doWhile(() async {
      value++;

      final resultPlaceOrder = await _placeOrder(PlaceOrderParams(
          actionType: actionType,
          symbol: symbol,
          volume: volume ?? await _riskVolume(),
          openPrice: 0.0, // value does not apply
          stopLoss: 0.0, // value does not apply
          takeProfit: 0.0, // value does not apply
          account: account));

      resultPlaceOrder.fold(
        (failure) async {
          emit(HomeError(failure.errorMessage));
        },
        (users) {
          value = 3;
          emit(HomeSucess(orderType: actionType, symbol: symbol));
        },
      );

      if (value == 3) {
        print('Finished with $value trade');
        return false;
      }
      print('Attemted to make trade $value times');
      return true;
    });
  }

  String _convertTwelveDataToMetaApiLive({required String symbolMetaApiDemo}) {
    String baseCurrency = '';
    String quoteCurrency = '';
    String brokerEnd = '.Z';
    for (var i = 0; i < 3; i++) {
      baseCurrency = baseCurrency + symbolMetaApiDemo[i];
      quoteCurrency = quoteCurrency + symbolMetaApiDemo[i + 4];
    }
    print('convertMetaApiDemo to live : $baseCurrency$quoteCurrency$brokerEnd');
    return '$baseCurrency$quoteCurrency$brokerEnd';
  }

  Future<double> _riskVolume() async {
    AccountInformation accountInformation = await _showAccountInfomation();
    double totalBalance = accountInformation.balance.toDouble();

    double highestFloatingPercentage = 0.20; // twenty percent
    double floatingFees = totalBalance * highestFloatingPercentage;
    double accountBalance = totalBalance - floatingFees;

    if (accountBalance > 10000) {
      accountBalance = 10000; // that is 10 000 (ten thousand) dollars
    }

    double volume = accountBalance / 10000;
    String volumeString = volume.toStringAsFixed(4);
    String volumeStringNew = '';

    for (var i = 0; i < volumeString.length - 2; i++) {
      volumeStringNew = volumeStringNew + volumeString[i];
    }

    double volumeDouble = double.parse(volumeStringNew);

    if (accountBalance < 100) {
      volumeDouble = 0.0; // invalid trade lot
    }

    return volumeDouble;
  }

  Future<AccountInformation> _showAccountInfomation() async {
    AccountInformation accountInformation = AccountInformation(
        platform: '',
        investorMode: false,
        balance: 0,
        broker: '',
        credit: 0,
        currency: '',
        equity: 0,
        freeMargin: 0,
        leverage: 0,
        login: 0,
        margin: 0,
        marginMode: '',
        name: '',
        server: '',
        tradeAllowed: false,
        type: '');

    var value = 0;
    await Future.doWhile(() async {
      value++;
      final resultGetAccountInfomation = await _getAccountInformation(
          const GetAccountInformationParams(account: 'LIVE'));

      resultGetAccountInfomation.fold((failure) async {
        emit(HomeError(failure.errorMessage));
      }, (accountInfo) async {
        accountInformation = accountInfo;
        value = 3;
      });

      if (value == 3) {
        print('Finished with $value accountInfomation');
        return false;
      }
      print('Getting account info failed $value times');
      return true;
    });

    return accountInformation;
  }

// ********************______________---------------********************
// screen with position

  Future<List<Position>> showPositions() async {
    List<Position> listPositions = <Position>[];
    emit(const LoadingData());

    var value = 0;
    await Future.doWhile(() async {
      value++;
      final resultGetAllPosition =
          await _getAllPosition(const GetAllPositionParams(account: 'LIVE'));

      resultGetAllPosition.fold((failure) async {
        emit(HomeError(failure.errorMessage));
        listPositions.add(Position(
            id: '',
            platform: '',
            type: '',
            symbol: '',
            magic: 0,
            time: DateTime(2000),
            brokerTime: DateTime(2000),
            updateTime: DateTime(2000),
            openPrice: 0,
            volume: 0,
            swap: 0,
            commission: 0,
            realizedSwap: 0,
            realizedCommission: 0,
            unrealizedSwap: 0,
            unrealizedCommission: 0,
            reason: '',
            currentPrice: 0,
            currentTickValue: 0,
            realizedProfit: 0,
            unrealizedProfit: 0,
            profit: 0,
            accountCurrencyExchangeRate: 0,
            updateSequenceNumber: 0));
      }, (positions) async {
        value = 3;
        positions.sort((a, b) {
          var atime = a.time;
          var btime = b.time;
          return btime.compareTo(
              atime); //to get the order other way just switch `adate & bdate`
        });

        countPosition = positions.length;
        for (var position in positions) {
          listPositions.add(position);
        }

        await _cleanUnwantedOrders(positions: positions).then((value) {
          emit(PositionsLoaded(positions));
        });
      });

      if (value == 3) {
        print('Finished with $value showPositions');
        return false;
      }
      print('showPositions failed $value times');
      return true;
    });

    return listPositions;
  }

  double hfCost({required Position position}) {
    double hfCost = _forexFees[
        _convertMetaApiToFinageSymbol(metaApiSymbol: position.symbol)]!;
    return hfCost;
  }

  Future<void> positionModifyTakeProfit({
    required List<Position> positions,
    required Position currentPosition,
  }) async {
    countPosition = riskNumberActiveTrades;

    double currentCharge = 0.0;

    List<Position> filterpositions = <Position>[];
    for (var position in positions) {
      if (position.symbol == currentPosition.symbol &&
          position.type == currentPosition.type) {
        filterpositions.add(position);
      }
    }

    filterpositions.sort((a, b) {
      var aVolume = a.volume;
      var bVolume = b.volume;
      return bVolume.compareTo(
          aVolume); //to get the order other way just switch `adate & bdate`
    });

    try {
      double hfCost = _forexTakeProfit[_convertMetaApiToFinageSymbol(
          metaApiSymbol: currentPosition.symbol)]!;

      double totalVolume = 0;

      currentCharge = filterpositions[0].volume.toDouble() * 100 * hfCost;

      for (var position in filterpositions) {
        double singleVolume = position.volume.toDouble() * 100;
        totalVolume = totalVolume + singleVolume;
      }

      List<bool> loopBooleanModify = <bool>[];
      List<bool> loopBooleanDelete = <bool>[];
      if (currentPosition.type == 'POSITION_TYPE_BUY') {
        for (var i = 0; i < filterpositions.length; i++) {
          double targetValue =
              filterpositions[i].volume.toDouble() * 100 * hfCost / totalVolume;
          if (targetValue < 0) {
            targetValue = targetValue * -1;
          }

          double buyProfit = 0;
          if (filterpositions[i].profit < targetValue) {
            if (hfCost > 0) {
              buyProfit = _buyProfit(
                  startPrice: filterpositions[i].openPrice.toDouble(),
                  currentPrice: filterpositions[i].currentPrice.toDouble(),
                  profit: filterpositions[i].profit.toDouble(),
                  targetValue: targetValue);
            } else {
              buyProfit = _sellProfit(
                  startPrice: filterpositions[i].openPrice.toDouble(),
                  currentPrice: filterpositions[i].currentPrice.toDouble(),
                  profit: filterpositions[i].profit.toDouble(),
                  targetValue: targetValue);
            }

            bool isBoolean = await _performModifyPosition(
                positionId: filterpositions[i].id, takeProfit: buyProfit);
            loopBooleanModify.add(isBoolean);
          } else {
            loopBooleanDelete.add(await _deleteOnePosition(
                position: filterpositions[i], account: 'LIVE'));
          }
        }
      }

      if (currentPosition.type == 'POSITION_TYPE_SELL') {
        for (var i = 0; i < filterpositions.length; i++) {
          double targetValue =
              filterpositions[i].volume.toDouble() * 100 * hfCost / totalVolume;
          if (targetValue < 0) {
            targetValue = targetValue * -1;
          }
          double sellProfit = 0;

          if (filterpositions[i].profit < targetValue) {
            if (hfCost < 0) {
              sellProfit = _buyProfit(
                  startPrice: filterpositions[i].openPrice.toDouble(),
                  currentPrice: filterpositions[i].currentPrice.toDouble(),
                  profit: filterpositions[i].profit.toDouble(),
                  targetValue: targetValue);
            } else {
              sellProfit = _sellProfit(
                  startPrice: filterpositions[i].openPrice.toDouble(),
                  currentPrice: filterpositions[i].currentPrice.toDouble(),
                  profit: filterpositions[i].profit.toDouble(),
                  targetValue: targetValue);
            }

            bool isBoolean = await _performModifyPosition(
                positionId: filterpositions[i].id, takeProfit: sellProfit);
            loopBooleanModify.add(isBoolean);
          } else {
            loopBooleanDelete.add(await _deleteOnePosition(
                position: filterpositions[i], account: 'LIVE'));
          }
        }
      }
      if (loopBooleanModify.contains(false)) {
        emit(PositionsLoaded(positions));
        emit(const HomeError('Modify did not happen'));
      } else if (loopBooleanDelete.contains(true)) {
        emit(HomeSucess(
            orderType: "POSITION_CLOSE_ID", symbol: currentPosition.symbol));
      } else {
        emit(ModifiedPosition(
            positions: positions,
            currentPosition: filterpositions[0],
            currentCharge: currentCharge));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> positionModifyClearProfit({
    required List<Position> positions,
    required Position currentPosition,
  }) async {
    countPosition = riskNumberActiveTrades;

    double currentCharge = 0.0;

    List<Position> filterpositions = <Position>[];
    for (var position in positions) {
      if (position.symbol == currentPosition.symbol &&
          position.type == currentPosition.type) {
        filterpositions.add(position);
      }
    }

    filterpositions.sort((a, b) {
      var aVolume = a.volume;
      var bVolume = b.volume;
      return bVolume.compareTo(
          aVolume); //to get the order other way just switch `adate & bdate`
    });

    try {
      List<bool> loopBoolean = <bool>[];
      if (currentPosition.type == 'POSITION_TYPE_BUY') {
        for (var position in filterpositions) {
          bool isBoolean = await _performModifyPosition(
              positionId: position.id, takeProfit: 0.0);
          loopBoolean.add(isBoolean);
        }
      }

      if (currentPosition.type == 'POSITION_TYPE_SELL') {
        for (var position in filterpositions) {
          bool isBoolean = await _performModifyPosition(
              positionId: position.id, takeProfit: 0.0);
          loopBoolean.add(isBoolean);
        }
      }
      if (loopBoolean.contains(false)) {
        emit(const HomeError('Modify did not happen'));
        showPositions();
      } else {
        emit(ModifiedPosition(
            positions: positions,
            currentPosition: filterpositions[0],
            currentCharge: currentCharge));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> deleteSymbolType({
    required List<Position> positions,
    required Position currentPosition,
  }) async {
    countPosition = riskNumberActiveTrades;

    List<bool> loopBooleanDelete = <bool>[];

    for (var position in positions) {
      // symbol refers to currency
      // type refers to buy or sell
      if (position.symbol == currentPosition.symbol &&
          position.type == currentPosition.type) {
        loopBooleanDelete
            .add(await _deleteOnePosition(position: position, account: 'LIVE'));
      }
    }

    if (loopBooleanDelete.isEmpty) {
      emit(const HomeError('No position was deleted'));
    } else if (loopBooleanDelete.contains(false)) {
      emit(const HomeError('Not all positions deleted'));
    } else if (loopBooleanDelete.contains(true)) {
      emit(HomeSucess(
          orderType: "POSITION_CLOSE_ID", symbol: currentPosition.symbol));
    }
  }

  Future<void> deleteSymbol({
    required List<Position> positions,
    required Position currentPosition,
  }) async {
    countPosition = riskNumberActiveTrades;

    List<bool> loopBooleanDelete = <bool>[];

    for (var position in positions) {
      if (position.symbol == currentPosition.symbol) {
        loopBooleanDelete
            .add(await _deleteOnePosition(position: position, account: 'LIVE'));
      }
    }

    if (loopBooleanDelete.isEmpty) {
      emit(const HomeError('No position was deleted'));
    } else if (loopBooleanDelete.contains(false)) {
      emit(const HomeError('Not all positions deleted'));
    } else if (loopBooleanDelete.contains(true)) {
      emit(HomeSucess(
          orderType: "POSITION_CLOSE_ID", symbol: currentPosition.symbol));
    }
  }

  Future<void> deletePositiveProfit({
    required List<Position> positions,
  }) async {
    countPosition = riskNumberActiveTrades;

    List<bool> loopBooleanDelete = <bool>[];

    for (var position in positions) {
      if (position.profit.toDouble() > 0) {
        loopBooleanDelete
            .add(await _deleteOnePosition(position: position, account: 'LIVE'));
      }
    }

    if (loopBooleanDelete.isEmpty) {
      emit(const HomeError('No profit was found'));
    } else if (loopBooleanDelete.contains(false)) {
      emit(const HomeError('Not all profit deleted'));
    } else if (loopBooleanDelete.contains(true)) {
      emit(const HomeSucess(
          orderType: "POSITION_CLOSE_ID", symbol: "Positive Symbol"));
    }
  }

  Future<void> doubleIn({
    required Position currentPosition,
  }) async {
    countPosition = riskNumberActiveTrades;
    await _makeTrade(
        actionType: "ORDER_TYPE_SELL",
        symbolMetaApiLive: currentPosition.symbol,
        volume: currentPosition.volume.toDouble() * 2,
        account: 'LIVE');

    await _makeTrade(
        actionType: "ORDER_TYPE_BUY",
        symbolMetaApiLive: currentPosition.symbol,
        volume: currentPosition.volume.toDouble() * 2,
        account: 'LIVE');
  }

  Future<void> deleteOutAndIn({
    required List<Position> positions,
    required Position currentPosition,
  }) async {
    countPosition = riskNumberActiveTrades;

    List<bool> loopBooleanDelete = <bool>[];

    // separate the buy and sell symbols
    List<Position> buyList = <Position>[];
    List<Position> sellList = <Position>[];
    for (var position in positions) {
      if (position.symbol == currentPosition.symbol &&
          position.type == 'POSITION_TYPE_BUY') {
        buyList.add(position);
      } else if (position.symbol == currentPosition.symbol &&
          position.type == 'POSITION_TYPE_SELL') {
        sellList.add(position);
      }
    }

    List<Position> optionList = <Position>[];

    // figures out the currentPosition type
    if (currentPosition.type == 'POSITION_TYPE_BUY') {
      optionList = sellList;
    } else {
      optionList = buyList;
    }

    // arrange the optionList by time, smaller time to older time
    optionList.sort((a, b) {
      var aTime = a.time;
      var bTime = b.time;
      return aTime.compareTo(
          bTime); //to get the order other way just switch `adate & bdate`
    });

    // deletes the opposite type of the currentposition, leaving only one,
    if (optionList.length > 1) {
      for (var i = 0; i < optionList.length - 1; i++) {
        loopBooleanDelete.add(
            await _deleteOnePosition(position: optionList[i], account: 'LIVE'));
      }
    }

    // currentposition get deleted
    loopBooleanDelete.add(
        await _deleteOnePosition(position: currentPosition, account: 'LIVE'));

    if (loopBooleanDelete.isEmpty) {
      emit(const HomeError('Delete did not happen'));
    } else if (loopBooleanDelete.contains(true)) {
      await _makeTrade(
          actionType: "ORDER_TYPE_SELL",
          symbolMetaApiLive: currentPosition.symbol,
          volume: optionList[optionList.length - 1].volume.toDouble() * 2,
          account: 'LIVE');

      await _makeTrade(
          actionType: "ORDER_TYPE_BUY",
          symbolMetaApiLive: currentPosition.symbol,
          volume: optionList[optionList.length - 1].volume.toDouble() * 2,
          account: 'LIVE');
    }
  }

  Future<void> deleteOut({
    required List<Position> positions,
    required Position currentPosition,
  }) async {
    countPosition = riskNumberActiveTrades;

    List<bool> loopBooleanDelete = <bool>[];

    for (var position in positions) {
      if (position.symbol == currentPosition.symbol) {
        loopBooleanDelete
            .add(await _deleteOnePosition(position: position, account: 'LIVE'));
      }
    }

    if (loopBooleanDelete.isEmpty) {
      emit(const HomeError('No profit was found'));
    } else if (loopBooleanDelete.contains(false)) {
      emit(const HomeError('Not all were deleted'));
    } else if (loopBooleanDelete.contains(true)) {
      emit(const HomeSucess(
          orderType: "POSITION_CLOSE_ID", symbol: "Neutral Symbol"));
    }
  }

  Future<void> _cleanUnwantedOrders({required List<Position> positions}) async {
    emit(const LoadingData());

    List<String> sellListPositionSymbol = <String>[];
    List<String> buyListPositionSymbol = <String>[];

    List<AOrder> sellListOrder = <AOrder>[];
    List<AOrder> buyListOrder = <AOrder>[];

    for (var position in positions) {
      if (position.type == 'POSITION_TYPE_SELL') {
        sellListPositionSymbol.add(position.symbol);
      } else {
        buyListPositionSymbol.add(position.symbol);
      }
    }

    var value = 0;
    await Future.doWhile(() async {
      value++;
      final resultAllOrder =
          await _getAllOrder(const GetAllOrderParams(account: 'LIVE'));

      resultAllOrder.fold((failure) {
        emit(HomeError(failure.errorMessage));
      }, (orders) async {
        value = 3;
        for (var order in orders) {
          if (order.type == 'ORDER_TYPE_SELL_LIMIT' ||
              order.type == 'ORDER_TYPE_SELL_STOP' ||
              order.type == 'ORDER_TYPE_SELL_STOP_LIMIT') {
            sellListOrder.add(order);
          } else {
            buyListOrder.add(order);
          }
        }
      });

      if (value == 3) {
        print('Finished with $value');
        return false;
      }
      return true;
    });

    for (var order in sellListOrder) {
      if (!sellListPositionSymbol.contains(order.symbol)) {
        await _deleteOneOrder(order: order);
      }
    }

    for (var order in buyListOrder) {
      if (!buyListPositionSymbol.contains(order.symbol)) {
        await _deleteOneOrder(order: order);
      }
    }
  }

  String _convertMetaApiToFinageSymbol({required String metaApiSymbol}) {
    String finageSymbol = '';
    for (var i = 0; i < 6; i++) {
      finageSymbol = finageSymbol + metaApiSymbol[i];
    }
    print('the finage symbol is $finageSymbol');
    return finageSymbol;
  }

  double _buyProfit({
    required double startPrice,
    required double currentPrice,
    required double profit,
    required double targetValue,
  }) {
    double price = startPrice;

    price = price +
        _movePips(
            startPrice: startPrice,
            currentPrice: currentPrice,
            profit: profit,
            targetValue: targetValue);
    return price;
  }

  double _sellProfit({
    required double startPrice,
    required double currentPrice,
    required double profit,
    required double targetValue,
  }) {
    double price = startPrice;

    price = price -
        _movePips(
            startPrice: startPrice,
            currentPrice: currentPrice,
            profit: profit,
            targetValue: targetValue);
    return price;
  }

  double _movePips(
      {required double startPrice,
      required double currentPrice,
      required double targetValue,
      required double profit}) {
    var difference = startPrice - currentPrice;

    if (difference < 0) {
      difference = difference * -1;
    }

    if (profit < 0) {
      profit = profit * -1;
    }
    return targetValue * difference / profit;
  }

  Future<bool> _deleteOnePosition(
      {required Position position, required String account}) async {
    return _deleteOneTrade(positionOrOrder: position, account: account);
  }

  Future<bool> _deleteOneTrade(
      {var positionOrOrder, required String account}) async {
    bool isDeleted = false;

    var value = 0;
    await Future.doWhile(() async {
      value++;

      final resultDeleteATrade = await _deleteATrade(DeleteATradeParams(
          positionOrOrderId: positionOrOrder.id, account: account));

      resultDeleteATrade.fold(
        (failure) {
          emit(HomeError(failure.errorMessage));
        },
        (users) {
          value = 3;
          isDeleted = true;
        },
      );

      if (value == 3) {
        print('Finished with $value deleteOneTrade');
        return false;
      }
      print('delete one trade failed $value times');
      return true;
    });

    return isDeleted;
  }

  Future<bool> _performModifyPosition(
      {required String positionId, required double takeProfit}) async {
    bool isBoolean = false;
    emit(const LoadingData());

    var value = 0;
    await Future.doWhile(() async {
      value++;
      final resultModifyPosition = await _doModifyPosition(
          DoModifyPositionParams(
              positionId: positionId, takeProfit: takeProfit, account: 'LIVE'));

      resultModifyPosition.fold((failure) async {
        emit(HomeError(failure.message));
      }, (success) {
        value = 3;
        isBoolean = true;
      });
      if (value == 3) {
        print('Finished with $value performModifyPosition');
        return false;
      }
      print('performModifyPosition failed $value times');
      return true;
    });

    return isBoolean;
  }

  // ********************______________---------------********************
// second screen - after position screen

  void placeTheNextOrder(
      {required Position position, required double currentCharge}) async {
    emit(const LoadingData());
    countPosition = riskNumberActiveTrades;

    await _cleanOldOrders(symbol: position.symbol);

    double volume = position.volume.toDouble() + 0.01;
    //  double unitCharge = position.volume.toDouble() * 100 * 2;
    if (currentCharge < 0) {
      currentCharge = currentCharge * -1;
    }

    // double targetValue = currentCharge + unitCharge;
    double targetValue = 2 * currentCharge;

    if (position.type == 'POSITION_TYPE_BUY') {
      String actionType = 'ORDER_TYPE_BUY_LIMIT';

      await _makeLimitTrade(
          actionType: actionType,
          symbol: position.symbol,
          volume: volume,
          openPrice: _buyLimitPrice(
              startPrice: position.openPrice.toDouble(),
              currentPrice: position.currentPrice.toDouble(),
              profit: position.profit.toDouble(),
              targetValue: targetValue));
    }

    if (position.type == 'POSITION_TYPE_SELL') {
      String actionType = 'ORDER_TYPE_SELL_LIMIT';

      await _makeLimitTrade(
          actionType: actionType,
          symbol: position.symbol,
          volume: volume,
          openPrice: _sellLimitPrice(
              startPrice: position.openPrice.toDouble(),
              currentPrice: position.currentPrice.toDouble(),
              profit: position.profit.toDouble(),
              targetValue: targetValue));
    }
  }

  Future<void> _cleanOldOrders({required String symbol}) async {
    emit(const LoadingData());

    final resultAllOrder =
        await _getAllOrder(const GetAllOrderParams(account: 'LIVE'));

    resultAllOrder.fold((failure) {
      emit(HomeError(failure.errorMessage));
    }, (orders) async {
      for (var order in orders) {
        if (order.symbol == symbol) {
          await _deleteOneOrder(order: order);
        }
      }
    });
  }

  Future<void> _deleteOneOrder({required AOrder order}) async {
    await _deleteOneTrade(positionOrOrder: order, account: 'LIVE');
  }

  double _sellLimitPrice({
    required double startPrice,
    required double currentPrice,
    required double profit,
    required double targetValue,
  }) {
    double price = startPrice;

    price = price +
        _movePips(
            startPrice: startPrice,
            currentPrice: currentPrice,
            profit: profit,
            targetValue: targetValue);
    return price;
  }

  double _buyLimitPrice({
    required double startPrice,
    required double currentPrice,
    required double profit,
    required double targetValue,
  }) {
    double price = startPrice;

    price = price -
        _movePips(
            startPrice: startPrice,
            currentPrice: currentPrice,
            profit: profit,
            targetValue: targetValue);
    return price;
  }

  Future<void> _makeLimitTrade(
      {required String actionType,
      required String symbol,
      required double volume,
      required double openPrice}) async {
    emit(const LoadingData());

    final resultPlaceOrder = await _placeOrder(PlaceOrderParams(
        actionType: actionType,
        symbol: symbol,
        volume: volume,
        openPrice: openPrice,
        stopLoss: 0.0, // value does not apply
        takeProfit: 0.0, // value does not apply
        account: 'LIVE'));

    resultPlaceOrder.fold(
      (failure) {
        emit(HomeError(failure.errorMessage));
      },
      (data) async {
        emit(HomeSucess(orderType: actionType, symbol: symbol));
      },
    );
  }

  void dontDoIt({required List<Position> positions}) {
    countPosition = riskNumberActiveTrades;
    emit(PositionsLoaded(positions));
  }

// -------------------*******************________________________________
// single test case area

  Future<void> cronJob() async {
    final date = DateTime.now();
    int number = date.weekdayFromSunday;

    if (number == 2 || number == 3 || number == 4 || number == 5) {
      await singleTest();
    } else if (number == 6) {
      await singleTestFri();
    }
  }

  Future<String> singleTest() async {
    String gender = "Male";

    //go check all position
    List<Position> listPosition = <Position>[];
    await showPositions().then((positions) {
      for (var position in positions) {
        listPosition.add(position);
      }
    });

    if (listPosition.isEmpty) {
      // startTrading
      await startTrading().then((value) {
        gender = "Female";
      });
    } else if (listPosition.length == 2) {
      // check if volume are identical
      await _secondTestCase(listPosition: listPosition).then((value) {
        gender = "Female";
      });
    } else if (listPosition.length == 3) {
      // check if profit sum total is positive
      await _profitSumTotal(listPosition: listPosition).then((value) {
        gender = "Female";
      });
    } else {
      if (listPosition.length == 1) {
        if (listPosition[0].id == '') {
          listPosition.remove(listPosition[0]);
        }
      }

      if (listPosition.isNotEmpty) {
        await deleteOut(
            positions: listPosition, currentPosition: listPosition[0]);
      }
    }

    return gender;
  }

  Future<String> singleTestFri() async {
    String gender = "Male";

    // go check all position
    List<Position> listPosition = <Position>[];
    await showPositions().then((positions) {
      for (var position in positions) {
        listPosition.add(position);
      }
    });

    if (listPosition.isEmpty) {
      gender = "Female";
    } else if (listPosition.length == 2) {
      // check if volume are identical
      await _secondTestCase(listPosition: listPosition).then((value) {
        gender = "Female";
      });
    } else if (listPosition.length == 3) {
      // check if profit sum total is positive
      await _profitSumTotal(listPosition: listPosition).then((value) {
        gender = "Female";
      });
    } else {
      if (listPosition.length == 1) {
        if (listPosition[0].id == '') {
          listPosition.remove(listPosition[0]);
        }
      }

      if (listPosition.isNotEmpty) {
        await deleteOut(
            positions: listPosition, currentPosition: listPosition[0]);
      }
    }

    return gender;
  }

  Future<void> _secondTestCase({required List<Position> listPosition}) async {
    if (listPosition[0].volume == listPosition[1].volume &&
        listPosition[0].symbol == listPosition[1].symbol) {
      // find the required difference
      double volume = listPosition[0].volume.toDouble();
      double requiredDollar = volume * 100;

      // boiler code reduction
      double profitAtZero = listPosition[0].profit.toDouble();
      double profitAtOne = listPosition[1].profit.toDouble();

      // ensure requiredDollar is positive
      if (requiredDollar > 0) {
        if (profitAtZero > profitAtOne) {
          // check if trade has such difference
          if (listPosition[0].profit.toDouble() >= requiredDollar) {
            // delete it and place in two more
            await deleteOutAndIn(
                positions: listPosition, currentPosition: listPosition[0]);
          }
        } else if (profitAtOne > profitAtZero) {
          // check if trade has such difference
          if (listPosition[1].profit.toDouble() >= requiredDollar) {
            // delete it and place in two more
            await deleteOutAndIn(
                positions: listPosition, currentPosition: listPosition[1]);
          }
        }
      }
    } else {
      await deleteOut(
          positions: listPosition, currentPosition: listPosition[0]);
    }
  }

  Future<void> _profitSumTotal({required List<Position> listPosition}) async {
    // ensures all symbols are the same
    if (listPosition[0].symbol == listPosition[1].symbol &&
        listPosition[1].symbol == listPosition[2].symbol) {
      double profitSum = 0;
      for (var position in listPosition) {
        double profit = position.profit.toDouble();
        profitSum = profitSum + profit;
      }

      if (profitSum > 0) {
        // delete everything
        await deleteOut(
            positions: listPosition, currentPosition: listPosition[0]);
      } else {
        await _profitSumIsNegative(listPosition: listPosition);
      }
    } else {
      await deleteOut(
          positions: listPosition, currentPosition: listPosition[0]);
    }
  }

  Future<void> _profitSumIsNegative(
      {required List<Position> listPosition}) async {
    if (listPosition[0].volume < listPosition[1].volume &&
        listPosition[0].volume < listPosition[2].volume) {
      List<Position> bigVolumePosition = <Position>[
        listPosition[1],
        listPosition[2]
      ];

      await _thirdTestCaseDeleteCalculation(
          bigVolumePosition: bigVolumePosition,
          smallVolumePosition: listPosition[0],
          listPosition: listPosition);
    } else if (listPosition[1].volume < listPosition[0].volume &&
        listPosition[1].volume < listPosition[2].volume) {
      List<Position> bigVolumePosition = <Position>[
        listPosition[0],
        listPosition[2]
      ];

      await _thirdTestCaseDeleteCalculation(
          bigVolumePosition: bigVolumePosition,
          smallVolumePosition: listPosition[1],
          listPosition: listPosition);
    } else if (listPosition[2].volume < listPosition[0].volume &&
        listPosition[2].volume < listPosition[1].volume) {
      List<Position> bigVolumePosition = <Position>[
        listPosition[0],
        listPosition[1]
      ];

      await _thirdTestCaseDeleteCalculation(
          bigVolumePosition: bigVolumePosition,
          smallVolumePosition: listPosition[2],
          listPosition: listPosition);
    }
  }

  Future<void> _thirdTestCaseDeleteCalculation(
      {required List<Position> bigVolumePosition,
      required Position smallVolumePosition,
      required List<Position> listPosition}) async {
    // check if volume are identical
    if (bigVolumePosition[0].type != bigVolumePosition[1].type &&
        bigVolumePosition[0].volume == bigVolumePosition[1].volume &&
        smallVolumePosition.volume < bigVolumePosition[0].volume) {
      double profitCheck = smallVolumePosition.profit.toDouble();

      double sameBigSmallTypeProfit = 0;
      Position oppositeBigSmallTypePosition;

      // find identical types from small and big volume positons
      if (smallVolumePosition.type == bigVolumePosition[0].type) {
        sameBigSmallTypeProfit = bigVolumePosition[0].profit.toDouble();
        oppositeBigSmallTypePosition = bigVolumePosition[1];
      } else {
        sameBigSmallTypeProfit = bigVolumePosition[1].profit.toDouble();
        oppositeBigSmallTypePosition = bigVolumePosition[0];
      }

      // The sum of the following Three is equivalent to the distance to success
      double addedFees = bigVolumePosition[0].profit.toDouble() +
          bigVolumePosition[1]
              .profit
              .toDouble(); // -0.22 + (-0.22) = - 0.44 from two new big positions
      double initialFees =
          2.5 * addedFees / 4; // counts fees adding two positions from start
      double takenProfit =
          100 * smallVolumePosition.volume.toDouble(); // target amount

      // We suppose to double up but we tripple up to account for flaution and ensure all answers are a positive sign
      double bigAddedFees = -3 * addedFees;
      double bigInitialFees = -3 * initialFees;
      double bigTakenProfit = 2 * takenProfit;

      // lag allows breaking points that are tracked on the  bigger volume
      double lag = bigAddedFees + bigInitialFees + bigTakenProfit;
      double fibonacci = takenProfit;
      double lagFibonacci = lag + fibonacci;

      if (sameBigSmallTypeProfit >= lagFibonacci) {
        await deleteOut(
            positions: listPosition, currentPosition: listPosition[0]);
      } else if (profitCheck < 0) {
        // profitCheck must be a negative
        // convert profitCheck to positive
        double smallProfit = -profitCheck;
        double oppositeBigSmallTypePositionProfit =
            oppositeBigSmallTypePosition.profit.toDouble();
        double smallProfitWithFibonacci = smallProfit + takenProfit;

        if (oppositeBigSmallTypePositionProfit > 0 && smallProfit > 0) {
          if (oppositeBigSmallTypePositionProfit > smallProfitWithFibonacci ||
              oppositeBigSmallTypePositionProfit >= lagFibonacci) {
            // delete the position with small volume
            await _deleteOneTrade(
                positionOrOrder: smallVolumePosition, account: 'LIVE');
            // delete current position
            await deleteOutAndIn(
                positions: bigVolumePosition,
                currentPosition: oppositeBigSmallTypePosition);
          }
        }
      }
    } else {
      await deleteOut(
          positions: listPosition, currentPosition: listPosition[0]);
    }
  }
}

class Forex {
  Forex(
      {required this.name,
      required this.compare,
      required this.exchangeRate,
      this.orderType});

  String name;

  double compare;

  double exchangeRate;

  String? orderType;
}

class DoModifyPosition
    extends UsecaseWithParams<ModifyPosition, DoModifyPositionParams> {
  const DoModifyPosition(this._repository);

  final MetaApiRepository _repository;

  @override
  ResultFuture<ModifyPosition> call(DoModifyPositionParams params) async =>
      _repository.doModifyPosition(
          positionId: params.positionId,
          takeProfit: params.takeProfit,
          account: params.account);
}

class DoModifyPositionParams extends Equatable {
  const DoModifyPositionParams(
      {required this.positionId,
      required this.takeProfit,
      required this.account});

  const DoModifyPositionParams.empty()
      : this(
            positionId: '_empty.positionId',
            takeProfit: 0.0,
            account: '_empty.account');

  final String positionId;
  final double takeProfit;
  final String account;

  @override
  List<Object?> get props => [positionId, takeProfit, account];
}

class FirstQuote {
  final String endpoint;
  final List<Quote> quotes;
  final String requestedTime;
  final int timestamp;

  FirstQuote({
    required this.endpoint,
    required this.quotes,
    required this.requestedTime,
    required this.timestamp,
  });

  FirstQuote copyWith({
    String? endpoint,
    List<Quote>? quotes,
    String? requestedTime,
    int? timestamp,
  }) =>
      FirstQuote(
        endpoint: endpoint ?? this.endpoint,
        quotes: quotes ?? this.quotes,
        requestedTime: requestedTime ?? this.requestedTime,
        timestamp: timestamp ?? this.timestamp,
      );

  factory FirstQuote.fromJson(String str) =>
      FirstQuote.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FirstQuote.fromMap(Map<String, dynamic> json) => FirstQuote(
        endpoint: json["endpoint"],
        quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromMap(x))),
        requestedTime: json["requested_time"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "endpoint": endpoint,
        "quotes": List<dynamic>.from(quotes.map((x) => x.toMap())),
        "requested_time": requestedTime,
        "timestamp": timestamp,
      };
}

class Quote {
  final double ask;
  final String baseCurrency;
  final double bid;
  final double mid;
  final String quoteCurrency;

  Quote({
    required this.ask,
    required this.baseCurrency,
    required this.bid,
    required this.mid,
    required this.quoteCurrency,
  });

  Quote copyWith({
    double? ask,
    String? baseCurrency,
    double? bid,
    double? mid,
    String? quoteCurrency,
  }) =>
      Quote(
        ask: ask ?? this.ask,
        baseCurrency: baseCurrency ?? this.baseCurrency,
        bid: bid ?? this.bid,
        mid: mid ?? this.mid,
        quoteCurrency: quoteCurrency ?? this.quoteCurrency,
      );

  factory Quote.fromJson(String str) => Quote.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Quote.fromMap(Map<String, dynamic> json) => Quote(
        ask: json["ask"]?.toDouble(),
        baseCurrency: json["base_currency"],
        bid: json["bid"]?.toDouble(),
        mid: json["mid"]?.toDouble(),
        quoteCurrency: json["quote_currency"],
      );

  Map<String, dynamic> toMap() => {
        "ask": ask,
        "base_currency": baseCurrency,
        "bid": bid,
        "mid": mid,
        "quote_currency": quoteCurrency,
      };
}

class GetFirstQuote extends UsecaseWithParams<FirstQuote, GetFirstQuoteParams> {
  const GetFirstQuote(this._repository);

  final FirstQuoteRepository _repository;

  @override
  ResultFuture<FirstQuote> call(GetFirstQuoteParams params) async {
    return _repository.getFirstQuote(
        symbol: params.symbol, api_key: params.api_key);
  }
}

class GetFirstQuoteParams extends Equatable {
  const GetFirstQuoteParams({required this.symbol, required this.api_key});

  const GetFirstQuoteParams.empty()
      : this(symbol: '_empty.symbol', api_key: '_empty.api_key');

  final String symbol;
  final String api_key;

  @override
  List<Object?> get props => [symbol, api_key];
}

class GetTwelveData extends UsecaseWithParams<TwelveData, GetTwelveDataParams> {
  const GetTwelveData(this._repository);

  final TwelveDataRepository _repository;

  @override
  ResultFuture<TwelveData> call(GetTwelveDataParams params) async {
    return _repository.getTwelveData(
        symbol: params.symbol, authorization: params.authorization);
  }
}

class GetTwelveDataParams extends Equatable {
  const GetTwelveDataParams(
      {required this.symbol, required this.authorization});

  const GetTwelveDataParams.empty()
      : this(symbol: '_empty.symbol', authorization: '_empty.symbol');

  final String symbol;
  final String authorization;

  @override
  List<Object?> get props => [symbol, authorization];
}

class TwelveData {
  final Meta meta;
  final List<Value> values;
  final String status;

  const TwelveData({
    required this.meta,
    required this.values,
    required this.status,
  });

  factory TwelveData.fromJson(String str) =>
      TwelveData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TwelveData.fromMap(Map<String, dynamic> json) => TwelveData(
        meta: Meta.fromMap(json["meta"]),
        values: List<Value>.from(json["values"].map((x) => Value.fromMap(x))),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "meta": meta.toMap(),
        "values": List<dynamic>.from(values.map((x) => x.toMap())),
        "status": status,
      };
}

class Meta {
  final String symbol;
  final String interval;
  final String currencyBase;
  final String currencyQuote;
  final String type;

  Meta({
    required this.symbol,
    required this.interval,
    required this.currencyBase,
    required this.currencyQuote,
    required this.type,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        symbol: json["symbol"],
        interval: json["interval"],
        currencyBase: json["currency_base"],
        currencyQuote: json["currency_quote"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "symbol": symbol,
        "interval": interval,
        "currency_base": currencyBase,
        "currency_quote": currencyQuote,
        "type": type,
      };
}

class Value {
  final DateTime datetime;
  final String open;
  final String high;
  final String low;
  final String close;

  Value({
    required this.datetime,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  factory Value.fromJson(String str) => Value.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Value.fromMap(Map<String, dynamic> json) => Value(
        datetime: DateTime.parse(json["datetime"]),
        open: json["open"],
        high: json["high"],
        low: json["low"],
        close: json["close"],
      );

  Map<String, dynamic> toMap() => {
        "datetime": datetime.toIso8601String(),
        "open": open,
        "high": high,
        "low": low,
        "close": close,
      };
}

abstract class TwelveDataRepository {
  const TwelveDataRepository();

  ResultFuture<TwelveData> getTwelveData(
      {required String symbol, required String authorization});
}

class PlaceOrder extends UsecaseWithParams<OrderTrade, PlaceOrderParams> {
  const PlaceOrder(this._repository);

  final MetaApiRepository _repository;

  @override
  ResultFuture<OrderTrade> call(PlaceOrderParams params) async =>
      _repository.placeOrder(
          actionType: params.actionType,
          symbol: params.symbol,
          volume: params.volume,
          openPrice: params.openPrice,
          stopLoss: params.stopLoss,
          takeProfit: params.takeProfit,
          account: params.account);
}

class PlaceOrderParams extends Equatable {
  const PlaceOrderParams(
      {required this.actionType,
      required this.symbol,
      required this.volume,
      required this.openPrice,
      required this.stopLoss,
      required this.takeProfit,
      required this.account});

  const PlaceOrderParams.empty()
      : this(
            actionType: '_empty.actionType',
            symbol: '_empty.symbol',
            volume: 0.0,
            openPrice: 0.0,
            stopLoss: 0.0,
            takeProfit: 0.0,
            account: '_empty.account');

  final String actionType;
  final String symbol;
  final double volume;
  final double openPrice;
  final double stopLoss;
  final double takeProfit;
  final String account;

  @override
  List<Object?> get props =>
      [actionType, symbol, volume, openPrice, stopLoss, takeProfit, account];
}

class GetPosition extends UsecaseWithParams<Position, GetPositionParams> {
  const GetPosition(this._repository);

  final MetaApiRepository _repository;

  @override
  ResultFuture<Position> call(GetPositionParams params) async => _repository
      .getPosition(positionId: params.positionId, account: params.account);
}

class GetPositionParams extends Equatable {
  const GetPositionParams({required this.positionId, required this.account});

  const GetPositionParams.empty()
      : this(positionId: '_empty.positionId', account: '_empty.account');

  final String positionId;
  final String account;

  @override
  List<Object?> get props => [positionId, account];
}

abstract class FirstQuoteRepository {
  const FirstQuoteRepository();

  ResultFuture<FirstQuote> getFirstQuote(
      {required String symbol, required String api_key});
}

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // App Logic
    ..registerFactory(() => HomeCubit(
        getFirstQuote: sl(),
        getLastQuote: sl(),
        getTwelveData: sl(),
        getAccountInformation: sl(),
        placeOrder: sl(),
        deleteATrade: sl(),
        getAllPosition: sl(),
        getPosition: sl(),
        doModifyPosition: sl(),
        getAllOrder: sl()))

    // Use cases
    ..registerLazySingleton(() => GetFirstQuote(sl()))
    ..registerLazySingleton(() => GetLastQuote(sl()))
    ..registerLazySingleton(() => GetTwelveData(sl()))
    ..registerLazySingleton(() => GetAccountInformation(sl()))
    ..registerLazySingleton(() => PlaceOrder(sl()))
    ..registerLazySingleton(() => DeleteATrade(sl()))
    ..registerLazySingleton(() => GetAllPosition(sl()))
    ..registerLazySingleton(() => GetPosition(sl()))
    ..registerLazySingleton(() => DoModifyPosition(sl()))
    ..registerLazySingleton(() => GetAllOrder(sl()))

    // Repositories
    ..registerLazySingleton<FirstQuoteRepository>(
        () => FirstQuoteRepositoryImplementation(sl()))
    ..registerLazySingleton<LastQuoteRepository>(
        () => LastQuoteRepositoryImplementation(sl()))
    ..registerLazySingleton<TwelveDataRepository>(
        () => TwelveDataRepositoryImplementation(sl()))
    ..registerLazySingleton<MetaApiRepository>(
        () => MetaApiRepositoryImplementation(sl()))

    // Data Sources
    ..registerLazySingleton<FirstQuoteRemoteDataSource>(
        () => FirstQuoteRemoteDataSrcImpl(sl()))
    ..registerLazySingleton<LastQuoteRemoteDataSource>(
        () => LastQuoteRemoteDataSrcImpl(sl()))
    ..registerLazySingleton<TwelveDataRemoteDataSource>(
        () => TwelveDataRemoteDataSrcImpl(sl()))
    ..registerLazySingleton<MetaApiRemoteDataSource>(
        () => MetaApiRemoteDataSrcImpl(sl()))

    // External Dependencies
    ..registerLazySingleton(http.Client.new);
}

abstract class LastQuoteRemoteDataSource {
  Future<LastQuoteModel> getLastQuote(
      {required String symbol, required String apikey});
}

// https://api.finage.co.uk/last/forex/GBPUSD?apikey=YOUR_API_KEY
class LastQuoteRemoteDataSrcImpl implements LastQuoteRemoteDataSource {
  const LastQuoteRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<LastQuoteModel> getLastQuote(
      {required String symbol, required String apikey}) async {
    try {
      final queryParameters = {
        'apikey': apikey,
      };

      String kGetLastQuoteEndpoint = '/last/forex/$symbol';
      final response = await _client.get(
          Uri.https(kLastQuoteBaseUrl, kGetLastQuoteEndpoint, queryParameters));

      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      print(response.body);
      return LastQuoteModel.fromJson(response.body);
    } on APIException {
      print("api exception");
      rethrow;
    } catch (e) {
      print("catch error");
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}

class LastQuoteModel extends LastQuote {
  LastQuoteModel({
    required super.symbol,
    required super.ask,
    required super.bid,
    required super.timestamp,
  });

  @override
  LastQuoteModel copyWith({
    String? symbol,
    double? ask,
    double? bid,
    int? timestamp,
  }) =>
      LastQuoteModel(
        symbol: symbol ?? this.symbol,
        ask: ask ?? this.ask,
        bid: bid ?? this.bid,
        timestamp: timestamp ?? this.timestamp,
      );

  factory LastQuoteModel.fromJson(String str) =>
      LastQuoteModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory LastQuoteModel.fromMap(Map<String, dynamic> json) => LastQuoteModel(
        symbol: json["symbol"],
        ask: json["ask"]?.toDouble(),
        bid: json["bid"]?.toDouble(),
        timestamp: json["timestamp"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "symbol": symbol,
        "ask": ask,
        "bid": bid,
        "timestamp": timestamp,
      };
}

class LastQuoteRepositoryImplementation implements LastQuoteRepository {
  const LastQuoteRepositoryImplementation(this._remoteDataSource);

  final LastQuoteRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<LastQuote> getLastQuote(
      {required String symbol, required String apikey}) async {
    try {
      final result =
          await _remoteDataSource.getLastQuote(symbol: symbol, apikey: apikey);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}

abstract class MetaApiRemoteDataSource {
  Future<AccountInformationModel> getAccountInformation(
      {required String account});
  Future<OrderTradeModel> placeOrder(
      {required String actionType,
      required String symbol,
      required double volume,
      required double openPrice,
      required double stopLoss,
      required double takeProfit,
      required String account});

  Future<DeleteTradeModel> deleteATrade(
      {required String positionOrOrderId, required String account});

  Future<List<PositionModel>> getAllPositions({required String account});

  Future<PositionModel> getPosition(
      {required String positionId, required String account});

  Future<ModifyPositionModel> doModifyPosition(
      {required String positionId,
      required double takeProfit,
      required String account});

  Future<List<AOrderModel>> getAllOrders({required String account});
}

class AccountInformationModel extends AccountInformation {
  AccountInformationModel({
    required super.platform,
    required super.type,
    required super.broker,
    required super.currency,
    required super.server,
    required super.balance,
    required super.equity,
    required super.margin,
    required super.freeMargin,
    required super.leverage,
    required super.tradeAllowed,
    required super.investorMode,
    required super.marginMode,
    required super.name,
    required super.login,
    required super.credit,
  });

  @override
  AccountInformationModel copyWith({
    String? platform,
    String? type,
    String? broker,
    String? currency,
    String? server,
    num? balance,
    num? equity,
    num? margin,
    num? freeMargin,
    num? leverage,
    bool? tradeAllowed,
    bool? investorMode,
    String? marginMode,
    String? name,
    num? login,
    num? credit,
  }) =>
      AccountInformationModel(
        platform: platform ?? this.platform,
        type: type ?? this.type,
        broker: broker ?? this.broker,
        currency: currency ?? this.currency,
        server: server ?? this.server,
        balance: balance ?? this.balance,
        equity: equity ?? this.equity,
        margin: margin ?? this.margin,
        freeMargin: freeMargin ?? this.freeMargin,
        leverage: leverage ?? this.leverage,
        tradeAllowed: tradeAllowed ?? this.tradeAllowed,
        investorMode: investorMode ?? this.investorMode,
        marginMode: marginMode ?? this.marginMode,
        name: name ?? this.name,
        login: login ?? this.login,
        credit: credit ?? this.credit,
      );

  factory AccountInformationModel.fromJson(String str) =>
      AccountInformationModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory AccountInformationModel.fromMap(Map<String, dynamic> json) =>
      AccountInformationModel(
        platform: json["platform"],
        type: json["type"],
        broker: json["broker"],
        currency: json["currency"],
        server: json["server"],
        balance: json["balance"]?.toDouble(),
        equity: json["equity"]?.toDouble(),
        margin: json["margin"],
        freeMargin: json["freeMargin"]?.toDouble(),
        leverage: json["leverage"],
        tradeAllowed: json["tradeAllowed"],
        investorMode: json["investorMode"],
        marginMode: json["marginMode"],
        name: json["name"],
        login: json["login"],
        credit: json["credit"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "platform": platform,
        "type": type,
        "broker": broker,
        "currency": currency,
        "server": server,
        "balance": balance,
        "equity": equity,
        "margin": margin,
        "freeMargin": freeMargin,
        "leverage": leverage,
        "tradeAllowed": tradeAllowed,
        "investorMode": investorMode,
        "marginMode": marginMode,
        "name": name,
        "login": login,
        "credit": credit,
      };
}

class DeleteTradeModel extends DeleteTrade {
  DeleteTradeModel({
    required super.numericCode,
    required super.stringCode,
    required super.message,
    required super.orderId,
    super.positionId,
  });

  factory DeleteTradeModel.fromJson(String str) =>
      DeleteTradeModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory DeleteTradeModel.fromMap(Map<String, dynamic> json) =>
      DeleteTradeModel(
        numericCode: json["numericCode"],
        stringCode: json["stringCode"],
        message: json["message"],
        orderId: json["orderId"],
        positionId: json["positionId"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "numericCode": numericCode,
        "stringCode": stringCode,
        "message": message,
        "orderId": orderId,
        "positionId": positionId,
      };
}

class ModifyPositionModel extends ModifyPosition {
  ModifyPositionModel({
    required super.numericCode,
    required super.stringCode,
    required super.message,
    required super.positionId,
  });

  @override
  ModifyPositionModel copyWith({
    num? numericCode,
    String? stringCode,
    String? message,
    String? positionId,
  }) =>
      ModifyPositionModel(
        numericCode: numericCode ?? this.numericCode,
        stringCode: stringCode ?? this.stringCode,
        message: message ?? this.message,
        positionId: positionId ?? this.positionId,
      );

  factory ModifyPositionModel.fromJson(String str) =>
      ModifyPositionModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory ModifyPositionModel.fromMap(Map<String, dynamic> json) =>
      ModifyPositionModel(
        numericCode: json["numericCode"],
        stringCode: json["stringCode"],
        message: json["message"],
        positionId: json["positionId"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "numericCode": numericCode,
        "stringCode": stringCode,
        "message": message,
        "positionId": positionId,
      };
}

class AOrderModel extends AOrder {
  AOrderModel({
    required super.id,
    required super.type,
    required super.state,
    required super.symbol,
    required super.magic,
    required super.time,
    required super.brokerTime,
    required super.platform,
    required super.openPrice,
    required super.currentPrice,
    required super.volume,
    required super.currentVolume,
  });

  @override
  AOrderModel copyWith({
    String? id,
    String? type,
    String? state,
    String? symbol,
    int? magic,
    DateTime? time,
    DateTime? brokerTime,
    String? platform,
    double? openPrice,
    double? currentPrice,
    double? volume,
    double? currentVolume,
  }) =>
      AOrderModel(
        id: id ?? this.id,
        type: type ?? this.type,
        state: state ?? this.state,
        symbol: symbol ?? this.symbol,
        magic: magic ?? this.magic,
        time: time ?? this.time,
        brokerTime: brokerTime ?? this.brokerTime,
        platform: platform ?? this.platform,
        openPrice: openPrice ?? this.openPrice,
        currentPrice: currentPrice ?? this.currentPrice,
        volume: volume ?? this.volume,
        currentVolume: currentVolume ?? this.currentVolume,
      );

  factory AOrderModel.fromJson(String str) =>
      AOrderModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory AOrderModel.fromMap(Map<String, dynamic> json) => AOrderModel(
        id: json["id"],
        type: json["type"],
        state: json["state"],
        symbol: json["symbol"],
        magic: json["magic"],
        time: DateTime.parse(json["time"]),
        brokerTime: DateTime.parse(json["brokerTime"]),
        platform: json["platform"],
        openPrice: json["openPrice"]?.toDouble(),
        currentPrice: json["currentPrice"]?.toDouble(),
        volume: json["volume"]?.toDouble(),
        currentVolume: json["currentVolume"]?.toDouble(),
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "state": state,
        "symbol": symbol,
        "magic": magic,
        "time": time.toIso8601String(),
        "brokerTime": brokerTime.toIso8601String(),
        "platform": platform,
        "openPrice": openPrice,
        "currentPrice": currentPrice,
        "volume": volume,
        "currentVolume": currentVolume,
      };
}

class OrderTradeModel extends OrderTrade {
  OrderTradeModel({
    required super.numericCode,
    required super.stringCode,
    required super.message,
    required super.orderId,
    super.positionId,
    required super.tradeExecutionTime,
    required super.tradeStartTime,
  });

  factory OrderTradeModel.fromJson(String str) =>
      OrderTradeModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory OrderTradeModel.fromMap(Map<String, dynamic> json) => OrderTradeModel(
        numericCode: json["numericCode"],
        stringCode: json["stringCode"],
        message: json["message"],
        orderId: json["orderId"],
        positionId: json["positionId"],
        tradeExecutionTime: DateTime.parse(json["tradeExecutionTime"]),
        tradeStartTime: DateTime.parse(json["tradeStartTime"]),
      );

  @override
  Map<String, dynamic> toMap() => {
        "numericCode": numericCode,
        "stringCode": stringCode,
        "message": message,
        "orderId": orderId,
        "positionId": positionId,
        "tradeExecutionTime": tradeExecutionTime.toIso8601String(),
        "tradeStartTime": tradeStartTime.toIso8601String(),
      };
}

class PositionModel extends Position {
  PositionModel({
    required super.id,
    required super.platform,
    required super.type,
    required super.symbol,
    required super.magic,
    required super.time,
    required super.brokerTime,
    required super.updateTime,
    required super.openPrice,
    required super.volume,
    required super.swap,
    required super.commission,
    required super.realizedSwap,
    required super.realizedCommission,
    required super.unrealizedSwap,
    required super.unrealizedCommission,
    required super.reason,
    required super.currentPrice,
    required super.currentTickValue,
    required super.realizedProfit,
    required super.unrealizedProfit,
    required super.profit,
    required super.accountCurrencyExchangeRate,
    required super.updateSequenceNumber,
  });

  @override
  PositionModel copyWith({
    String? id,
    String? platform,
    String? type,
    String? symbol,
    int? magic,
    DateTime? time,
    DateTime? brokerTime,
    DateTime? updateTime,
    double? openPrice,
    double? volume,
    int? swap,
    int? commission,
    int? realizedSwap,
    int? realizedCommission,
    int? unrealizedSwap,
    int? unrealizedCommission,
    String? reason,
    double? currentPrice,
    int? currentTickValue,
    int? realizedProfit,
    double? unrealizedProfit,
    double? profit,
    int? accountCurrencyExchangeRate,
    int? updateSequenceNumber,
  }) =>
      PositionModel(
        id: id ?? this.id,
        platform: platform ?? this.platform,
        type: type ?? this.type,
        symbol: symbol ?? this.symbol,
        magic: magic ?? this.magic,
        time: time ?? this.time,
        brokerTime: brokerTime ?? this.brokerTime,
        updateTime: updateTime ?? this.updateTime,
        openPrice: openPrice ?? this.openPrice,
        volume: volume ?? this.volume,
        swap: swap ?? this.swap,
        commission: commission ?? this.commission,
        realizedSwap: realizedSwap ?? this.realizedSwap,
        realizedCommission: realizedCommission ?? this.realizedCommission,
        unrealizedSwap: unrealizedSwap ?? this.unrealizedSwap,
        unrealizedCommission: unrealizedCommission ?? this.unrealizedCommission,
        reason: reason ?? this.reason,
        currentPrice: currentPrice ?? this.currentPrice,
        currentTickValue: currentTickValue ?? this.currentTickValue,
        realizedProfit: realizedProfit ?? this.realizedProfit,
        unrealizedProfit: unrealizedProfit ?? this.unrealizedProfit,
        profit: profit ?? this.profit,
        accountCurrencyExchangeRate:
            accountCurrencyExchangeRate ?? this.accountCurrencyExchangeRate,
        updateSequenceNumber: updateSequenceNumber ?? this.updateSequenceNumber,
      );

  factory PositionModel.fromJson(String str) =>
      PositionModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory PositionModel.fromMap(Map<String, dynamic> json) => PositionModel(
        id: json["id"],
        platform: json["platform"],
        type: json["type"],
        symbol: json["symbol"],
        magic: json["magic"],
        time: DateTime.parse(json["time"]),
        brokerTime: DateTime.parse(json["brokerTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
        openPrice: json["openPrice"]?.toDouble(),
        volume: json["volume"]?.toDouble(),
        swap: json["swap"],
        commission: json["commission"],
        realizedSwap: json["realizedSwap"],
        realizedCommission: json["realizedCommission"],
        unrealizedSwap: json["unrealizedSwap"],
        unrealizedCommission: json["unrealizedCommission"],
        reason: json["reason"],
        currentPrice: json["currentPrice"]?.toDouble(),
        currentTickValue: json["currentTickValue"],
        realizedProfit: json["realizedProfit"],
        unrealizedProfit: json["unrealizedProfit"]?.toDouble(),
        profit: json["profit"]?.toDouble(),
        accountCurrencyExchangeRate: json["accountCurrencyExchangeRate"],
        updateSequenceNumber: json["updateSequenceNumber"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "platform": platform,
        "type": type,
        "symbol": symbol,
        "magic": magic,
        "time": time.toIso8601String(),
        "brokerTime": brokerTime.toIso8601String(),
        "updateTime": updateTime.toIso8601String(),
        "openPrice": openPrice,
        "volume": volume,
        "swap": swap,
        "commission": commission,
        "realizedSwap": realizedSwap,
        "realizedCommission": realizedCommission,
        "unrealizedSwap": unrealizedSwap,
        "unrealizedCommission": unrealizedCommission,
        "reason": reason,
        "currentPrice": currentPrice,
        "currentTickValue": currentTickValue,
        "realizedProfit": realizedProfit,
        "unrealizedProfit": unrealizedProfit,
        "profit": profit,
        "accountCurrencyExchangeRate": accountCurrencyExchangeRate,
        "updateSequenceNumber": updateSequenceNumber,
      };
}

class MetaApiRepositoryImplementation implements MetaApiRepository {
  const MetaApiRepositoryImplementation(this._remoteDataSource);

  final MetaApiRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<AccountInformation> getAccountInformation(
      {required String account}) async {
    try {
      final result =
          await _remoteDataSource.getAccountInformation(account: account);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<OrderTrade> placeOrder(
      {required String actionType,
      required String symbol,
      required double volume,
      required double openPrice,
      required double stopLoss,
      required double takeProfit,
      required String account}) async {
    try {
      final result = await _remoteDataSource.placeOrder(
          actionType: actionType,
          symbol: symbol,
          volume: volume,
          openPrice: openPrice,
          stopLoss: stopLoss,
          takeProfit: takeProfit,
          account: account);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<DeleteTrade> deleteATrade(
      {required String positionOrOrderId, required String account}) async {
    try {
      final result = await _remoteDataSource.deleteATrade(
          positionOrOrderId: positionOrOrderId, account: account);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Position>> getAllPositions(
      {required String account}) async {
    try {
      final result = await _remoteDataSource.getAllPositions(account: account);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Position> getPosition(
      {required String positionId, required String account}) async {
    try {
      final result = await _remoteDataSource.getPosition(
          positionId: positionId, account: account);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<ModifyPosition> doModifyPosition(
      {required String positionId,
      required double takeProfit,
      required String account}) async {
    try {
      final result = await _remoteDataSource.doModifyPosition(
          positionId: positionId, takeProfit: takeProfit, account: account);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<AOrder>> getAllOrders({required String account}) async {
    try {
      final result = await _remoteDataSource.getAllOrders(account: account);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}

abstract class FirstQuoteRemoteDataSource {
  Future<FirstQuoteModel> getFirstQuote(
      {required String symbol, required String api_key});
}

// https://marketdata.tradermade.com/api/v1/live?currency=EURUSD&api_key=YOUR_API_KEY
class FirstQuoteRemoteDataSrcImpl implements FirstQuoteRemoteDataSource {
  const FirstQuoteRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<FirstQuoteModel> getFirstQuote(
      {required String symbol, required String api_key}) async {
    try {
      final queryParameters = {'api_key': api_key, 'currency': symbol};

      String kGetFirstQuoteEndpoint = '/api/v1/live';
      final response = await _client.get(Uri.https(
          kFirstQuoteBaseUrl, kGetFirstQuoteEndpoint, queryParameters));

      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      print(response.body);
      return FirstQuoteModel.fromJson(response.body);
    } on APIException {
      print("api exception");
      rethrow;
    } catch (e) {
      print("catch error");
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}

class FirstQuoteModel extends FirstQuote {
  FirstQuoteModel({
    required super.endpoint,
    required super.quotes,
    required super.requestedTime,
    required super.timestamp,
  });

  @override
  FirstQuoteModel copyWith({
    String? endpoint,
    List<Quote>? quotes,
    String? requestedTime,
    int? timestamp,
  }) =>
      FirstQuoteModel(
        endpoint: endpoint ?? this.endpoint,
        quotes: quotes ?? this.quotes,
        requestedTime: requestedTime ?? this.requestedTime,
        timestamp: timestamp ?? this.timestamp,
      );

  factory FirstQuoteModel.fromJson(String str) =>
      FirstQuoteModel.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory FirstQuoteModel.fromMap(Map<String, dynamic> json) => FirstQuoteModel(
        endpoint: json["endpoint"],
        quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromMap(x))),
        requestedTime: json["requested_time"],
        timestamp: json["timestamp"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "endpoint": endpoint,
        "quotes": List<dynamic>.from(quotes.map((x) => x.toMap())),
        "requested_time": requestedTime,
        "timestamp": timestamp,
      };
}

class FirstQuoteRepositoryImplementation implements FirstQuoteRepository {
  const FirstQuoteRepositoryImplementation(this._remoteDataSource);

  final FirstQuoteRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<FirstQuote> getFirstQuote(
      {required String symbol, required String api_key}) async {
    try {
      final result = await _remoteDataSource.getFirstQuote(
          symbol: symbol, api_key: api_key);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}

abstract class TwelveDataRemoteDataSource {
  Future<TwelveDataModel> getTwelveData(
      {required String symbol, required String authorization});
}

// http://api.twelvedata.com/time_series?symbol=EUR/USD&interval=1min&outputsize=12&apikey=demo
class TwelveDataRemoteDataSrcImpl implements TwelveDataRemoteDataSource {
  const TwelveDataRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<TwelveDataModel> getTwelveData(
      {required String symbol, required String authorization}) async {
    try {
      final queryParameters = {
        'symbol': symbol,
        'interval': '2h',
        'outputsize': '1',
        //       'apikey': 'demo',
      };

      final response = await _client.get(
          Uri.https(
              kTwelveDataBaseUrl, kGetTwelveDataEndpoint, queryParameters),
          headers: {'Authorization': authorization});

      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      print(response.body);
      return TwelveDataModel.fromJson(response.body);
    } on APIException {
      print("api exception");
      rethrow;
    } catch (e) {
      print("catch error");
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}

class TwelveDataModel extends TwelveData {
  const TwelveDataModel({
    required super.meta,
    required super.values,
    required super.status,
  });

  // const TwelveDataModel.empty()
  //     : this(
  //         // id: '1',
  //         // createdAt: '_empty.createdAt',
  //         // name: '_empty.name',
  //         // avatar: '_empty.avatar',
  //       );

  factory TwelveDataModel.fromJson(String source) =>
      TwelveDataModel.fromMap(jsonDecode(source) as DataMap);

  factory TwelveDataModel.fromMap(Map<String, dynamic> json) => TwelveDataModel(
        meta: Meta.fromMap(json["meta"]),
        values: List<Value>.from(json["values"].map((x) => Value.fromMap(x))),
        status: json["status"],
      );

  TwelveDataModel copyWith({
    Meta? meta,
    List<Value>? values,
    String? status,
  }) =>
      TwelveDataModel(
        meta: meta ?? this.meta,
        values: values ?? this.values,
        status: status ?? this.status,
      );

  @override
  Map<String, dynamic> toMap() => {
        "meta": meta.toMap(),
        "values": List<dynamic>.from(values.map((x) => x.toMap())),
        "status": status,
      };

  @override
  String toJson() => jsonEncode(toMap());
}

class TwelveDataRepositoryImplementation implements TwelveDataRepository {
  const TwelveDataRepositoryImplementation(this._remoteDataSource);

  final TwelveDataRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<TwelveData> getTwelveData(
      {required String symbol, required String authorization}) async {
    try {
      final result = await _remoteDataSource.getTwelveData(
          symbol: symbol, authorization: authorization);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
