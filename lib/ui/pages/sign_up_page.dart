part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User? user;
  File? pictureFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign Up',
      subtitle: "Register and eat",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              var pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                pictureFile = File(pickedFile.path);
                setState(() {
                  pictureFile;
                  debugPrint(pictureFile.toString());
                });
              }
            },
            child: Container(
              width: 110,
              height: 110,
              margin: const EdgeInsets.only(top: 26),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/photo_border.png"))),
              child: (pictureFile != null)
                  ? Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(pictureFile!),
                              fit: BoxFit.cover)),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/photo.png"),
                              fit: BoxFit.cover))),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Full Name",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your full name'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Email Address",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your email address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your password'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 24),
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: TextButton(
              onPressed: () {
                Get.to(AddressPage(
                    User(
                        name: nameController.text, email: emailController.text),
                    passwordController.text,
                    pictureFile));
              },
              style: TextButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: mainColor,
              ),
              child: Text(
                'Continue',
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}