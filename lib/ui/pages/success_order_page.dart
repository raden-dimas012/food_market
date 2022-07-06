part of 'pages.dart';

class SuccesOrderPage extends StatelessWidget {
  const SuccesOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "You’ve Made Order",
        subtitle: "Just stay at home while we are\npreparing your best foods",
        picturePath: "assets/bike.png",
        buttonOnTap1: () {
          return Get.offAll(MainPage());
        },
        buttonTitle1: "Order Other Foods",
        buttonOnTap2: () {
          Get.offAll(MainPage(initialPage: 1,));
        },
        buttonTitle2: "View My Order",
      ),
    );
  }
}