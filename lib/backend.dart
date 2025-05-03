import 'package:dio/dio.dart';

// need to remove auth header
Future<void> submitOTP(String orderId, String otp) async {
  try {
    await Dio()
        .patch('http://evegramservice-env.ap-south-1.elasticbeanstalk.com/inventory/mark-order-delivered/$orderId');
  } catch (e) {
    throw Exception(e.toString());
  }
}
