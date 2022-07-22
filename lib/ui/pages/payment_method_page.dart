part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentURL; // change from string 
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
          var uri = Uri.parse(paymentURL);
          await launchUrl(uri); // change from launch
        },
        buttonTitle1: "Payment Method",
        buttonOnTap2: () {
          Get.to(() => const SuccesOrderPage());
        },
        buttonTitle2: "View My Order",
      ),
    );
  }
}