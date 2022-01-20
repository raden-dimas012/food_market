part of 'pages.dart';

class FoodDetailsPage extends StatefulWidget {
  final Function? onBackBottonPresed;
  final Transaction? transaction;

  const FoodDetailsPage({Key? key, this.onBackBottonPresed, this.transaction})
      : super(key: key);

  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
              child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.transaction!.food!.picturePath),
                    fit: BoxFit.cover)),
          )),
          SafeArea(
            child: ListView(
              children: [
                ////BACK BOTTON
                Column(
                  children: [
                    Container(
                      height: 100,
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.onBackBottonPresed != null) {
                              widget.onBackBottonPresed!();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black26,
                            ),
                            child: Image.asset("assets/back_arrow_white.png"),
                          ),
                        ),
                      ),
                    ),
                    ////BODY
                    Container(
                      margin: const EdgeInsets.only(top: 180),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26, vertical: 16),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        2, //(32 + 102),
                                    child: Text(widget.transaction!.food!.name,
                                        style: blackFontStyle2),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  RatingStars(
                                    // rate: widget.transaction!.food!.rate,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = max(1, quantity - 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(width: 1),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/btn_min.png"))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Text(quantity.toString(),
                                        textAlign: TextAlign.center,
                                        style: blackFontStyle2),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = min(999, quantity + 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(width: 1),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/btn_add.png"))),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 14, 0, 16),
                            child: Text(widget.transaction!.food!.description,
                                style: greyFontStyle),
                          ),
                          Text("Ingredients", style: blackFontStyle2),
                          Text(widget.transaction!.food!.ingredients,
                              style: greyFontStyle),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total Price", style: greyFontStyle),
                                    Text(NumberFormat.currency(
                                            locale: "id-ID",
                                            symbol: "IDR ",
                                            decimalDigits: 0)
                                        .format(quantity *
                                            widget.transaction!.food!.price)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: mainColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        onPressed: () {
                                          Get.to(PaymentPage(
                                              transaction: widget.transaction!
                                                      .copyWith(
                                            quantity: quantity,
                                            total:
                                              quantity* widget.transaction!.food!.price,
                                          )));
                                        },
                                        child: Text("Order Now",
                                            style: blackFontStyle2),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}