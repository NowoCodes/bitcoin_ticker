import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NGN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

// const coinAPIURL = 'rest.coinapi.io';
// const apiKey = 'A5F01A9A-69B2-4EB7-9910-E2426E5DC421';
const nomicsAPIURL = 'https://api.nomics.com/v1/currencies/ticker';
const apiKey = '0541da9f55fb84f8ec18903d3daf4415';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      // COIN API using http package
      // var requestUrl = Uri.https(
      //     '$coinAPIURL',
      //     '/v1/exchangerate/$crypto/$selectedCurrency',
      //     {'apikey': '{$apiKey}'});
      // COIN API

      String requestUrl =
          '$nomicsAPIURL?key=$apiKey&ids=$crypto&convert=$selectedCurrency';
      http.Response response = await http.get(requestUrl);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        // COIN API
        // double price = decodedData['rate'];
        // cryptoPrices[crypto] = price.toStringAsFixed(0);
        // COIN API

        String price = decodedData[0]['price'];
        cryptoPrices[crypto] = double.parse(price).toStringAsFixed(0);
      } else {
        throw 'Problem with the get request. Status code: ${response.statusCode}';
      }
    }
    return cryptoPrices;
  }
}
