part of 'services.dart';

class TransactionService {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(const Duration(seconds: 3));

    return ApiReturnValue(value: mockTransactions);
  }

  // static Future<ApiReturnValue<List<Transaction>>> getTransactions(
  //     {http.Client? client}) async {
  //   // await Future.delayed(const Duration(seconds: 3));
  //   // return ApiReturnValue(value: mockTransactions, message: '');
  //   client ??= http.Client();

  //   String url = baseURL + '/transaction';
  //   var uri = Uri.parse(url);

  //   var response = await client.get(uri, headers: {
  //     "Content-Type": "application/json",
  //     "Authorization": "Bearer ${User.token}"
  //   });

  //   if (response.statusCode != 200) {
  //     debugPrint(response.body);
  //     return ApiReturnValue(message: 'Please try again');
  //   }

  //   var data = jsonDecode(response.body);

  //   List<Transaction> transactions = (data['data']['data'] as Iterable)
  //       .map((e) => Transaction.fromJson(e))
  //       .toList();

  //   return ApiReturnValue(value: transactions);
  // }

  // static Future<ApiReturnValue<Transaction>> signIn(
  //     Transaction transaction) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   return ApiReturnValue(
  //       value: transaction.copyWith(id: 123, status: TransactionStatus.pending),
  //       message: '');
  // }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(const Duration(seconds: 2));

    return ApiReturnValue(
        value:
            transaction.copyWith(id: 123, status: TransactionStatus.pending));
  }

//   static Future<ApiReturnValue<Transaction>> submitTransaction(
//       Transaction transaction,
//       {http.Client? client}) async {
//     // await Future.delayed(const Duration(seconds: 2));

//     client ??= http.Client();
//     String url = baseURL + '/checkout';
//     var uri = Uri.parse(url);

//     var response = await client.post(uri,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer ${User.token}"
//         },
//         body: jsonEncode(<String, dynamic>{
//           'food_id': transaction.food!.id,
//           'user_id': transaction.user!.id,
//           'quantity': transaction.quantity.toString(),
//           'total': transaction.total.toString(),
//           "status": "PENDING"
//         }));

//     if (response.statusCode != 200) {
//       return ApiReturnValue(message: 'Please try again');
//     }

//     var data = jsonDecode(response.body);

//     Transaction value = Transaction.fromJson(data['data']);

//     return ApiReturnValue(value: value);
//   }

}
