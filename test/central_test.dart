import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:flag/central.dart';

void main() {
  late HomeCubit homeCubit;
  late GetFirstQuote getFirstQuote;
  late GetLastQuote getLastQuote;
  late GetTwelveData getTwelveData;
  late GetAccountInformation getAccountInformation;
  late PlaceOrder placeOrder;
  late DeleteATrade deleteATrade;
  late GetAllPosition getAllPosition;
  late GetPosition getPosition;
  late DoModifyPosition doModifyPosition;
  late GetAllOrder getAllOrder;

  setUp(() async {
    // var httpClient = http.Client();
    var metaApiRepositoryImplementation = MetaApiRepositoryImplementation(
        MetaApiRemoteDataSrcImpl(http.Client()));

    getFirstQuote = GetFirstQuote(FirstQuoteRepositoryImplementation(
        FirstQuoteRemoteDataSrcImpl(http.Client())));
    getLastQuote = GetLastQuote(LastQuoteRepositoryImplementation(
        LastQuoteRemoteDataSrcImpl(http.Client())));
    getTwelveData = GetTwelveData(TwelveDataRepositoryImplementation(
        TwelveDataRemoteDataSrcImpl(http.Client())));
    getAccountInformation =
        GetAccountInformation(metaApiRepositoryImplementation);
    placeOrder = PlaceOrder(metaApiRepositoryImplementation);
    deleteATrade = DeleteATrade(metaApiRepositoryImplementation);
    getAllPosition = GetAllPosition(metaApiRepositoryImplementation);
    getPosition = GetPosition(metaApiRepositoryImplementation);
    doModifyPosition = DoModifyPosition(metaApiRepositoryImplementation);
    getAllOrder = GetAllOrder(metaApiRepositoryImplementation);

    homeCubit = HomeCubit(
        getFirstQuote: getFirstQuote,
        getLastQuote: getLastQuote,
        getTwelveData: getTwelveData,
        getAccountInformation: getAccountInformation,
        placeOrder: placeOrder,
        deleteATrade: deleteATrade,
        getAllPosition: getAllPosition,
        getPosition: getPosition,
        doModifyPosition: doModifyPosition,
        getAllOrder: getAllOrder);
  });

  group('Open', () {
    test('Should perform a single test.', () async {
      // Arrange

      // Act
      String gender = await homeCubit.singleTest();

      // Asset
      expect(gender, 'Female');
    });
  });

  group('Close', () {
    test('- Should perform a single test.', () async {
      // Arrange

      // Act
      String gender = await homeCubit.singleTestFri();
      // Asset
      expect(gender, 'Female');
    });
  });
}
