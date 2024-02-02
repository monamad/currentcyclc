import 'package:currencyclc/api/getprice.dart';

class GetcoinsData {
  Map<String, dynamic>? _cachedData;

  Future<Map<String, dynamic>> _fetchData() async {
    _cachedData ??= await Getdata().get();
    return _cachedData!;
  }

  Future<List<String>> getcoinsName() async {
    Map<String, dynamic> data = await _fetchData();
    Iterable<String> coinsname = data.keys;
    return coinsname.toList();
  }

  Future<dynamic> getAsDolor(String coinName) async {
    Map<String, dynamic> data = await _fetchData();
    double number = data[coinName].toDouble();
    print(number);
    return number;
  }
}
