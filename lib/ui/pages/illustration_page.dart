part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTitle1;
  final String? buttonTitle2;
  final Function buttonOnTap1;
  final Function? buttonOnTap2;

  const IllustrationPage(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.picturePath,
      required this.buttonTitle1,
      this.buttonTitle2,
      required this.buttonOnTap1,
      this.buttonOnTap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(picturePath))),
          ),
          Text(title, style: blackFontStyle3.copyWith(fontSize: 20)),
          Text(subtitle,
              style: greyFontStyle.copyWith(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center),
          Container(
            width: 200,
            height: 45,
            margin: const EdgeInsets.only(top: 30, bottom: 12),
            child: TextButton(
                onPressed: () {
                  buttonOnTap1();
                },
                style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text(buttonTitle1,
                    style:
                        blackFontStyle3.copyWith(fontWeight: FontWeight.w500))),
          ),
          (buttonOnTap2 == null)
              ? const SizedBox()
              : SizedBox(
                  width: 200,
                  height: 45,
                  child: TextButton(
                      onPressed: () {
                        buttonOnTap2!();
                      },
                      style: TextButton.styleFrom(
                          elevation: 0,
                          backgroundColor: "8D92A3".toColor(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(buttonTitle2 ?? 'title',
                          style: blackFontStyle3.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white))),
                ),
        ],
      ),
    );
  }
}