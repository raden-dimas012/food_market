part of 'pages.dart';

class SuccesSignUpPage extends StatelessWidget {
  const SuccesSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "Yeay! Complete",
        subtitle: "Now you are able to order\nsome foods as a self-reward",
        picturePath: "assets/food_wishes.png",
        buttonOnTap1: () {},
        buttonTitle1: "Find Foods",
      ),
    );
  }
}