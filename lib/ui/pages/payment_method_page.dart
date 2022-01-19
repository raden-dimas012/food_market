part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentURL;

  const PaymentMethodPage({Key? key, required this.paymentURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "Finish Your Payment",
        subtitle: "Please select your favorite\npayment method",
        picturePath: "assets/Payment.png",
        buttonOnTap1: () async {
          await launch(paymentURL);
        },
        buttonTitle1: "Payment Method",
        buttonOnTap2: () {
          Get.to(const SuccesOrderPage());
        },
        buttonTitle2: "View My Order",
      ),
    );
  }
}