part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  const PaymentPage({Key? key, required this.transaction}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Payment",
      subtitle: "You deserve better meal",
      onBackButtonPressed: () {
        Get.back();
      },
      backColor: "FAFAFC".toColor(),
      child: Column(
        children: [
          ////BAGIAN ATAS
          Container(
              margin: const EdgeInsets.only(top: defaultMargin),
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Item Ordered", style: blackFontStyle2),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.transaction.food!.picturePath),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  widget.transaction.food!.name,
                                  style: blackFontStyle2,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Text(
                                  NumberFormat.currency(
                                    locale: "id-ID",
                                    symbol: "IDR ",
                                    decimalDigits: 0,
                                  ).format(widget.transaction.food!.price),
                                  style: greyFontStyle),
                            ],
                          ),
                        ],
                      ),
                      Text(widget.transaction.quantity.toString() + " item(s)",
                          style: greyFontStyle.copyWith(fontSize: 13))
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child:
                          Text("Details Transaction", style: blackFontStyle2)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(widget.transaction.food!.name,
                              style: greyFontStyle)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: "id-ID",
                                    decimalDigits: 0,
                                    symbol: "IDR ")
                                .format(widget.transaction.total),
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text("Driver", style: greyFontStyle)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: "id-ID",
                                    decimalDigits: 0,
                                    symbol: "IDR ")
                                .format(50000),
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text("Tax 10%", style: greyFontStyle)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: "id-ID",
                                    decimalDigits: 0,
                                    symbol: "IDR ")
                                .format(widget.transaction.total! * 0.1),
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text("Total Price", style: greyFontStyle)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: "id-ID",
                                    decimalDigits: 0,
                                    symbol: "IDR ")
                                .format(
                                    widget.transaction.total! * 1.1 + 50000),
                            style: blackFontStyle3.copyWith(
                              fontWeight: FontWeight.w500,
                              color: "1ABC9C".toColor(),
                            ),
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Deliver to:", style: blackFontStyle2),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text("Name", style: greyFontStyle)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.user!.name.toString(),
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text("Phone No.", style: greyFontStyle)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.user!.phoneNumber.toString(),
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            "Address",
                            style: greyFontStyle,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.user!.address.toString(),
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text("House No.", style: greyFontStyle)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.user!.houseNumber.toString(),
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text("City", style: greyFontStyle)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.user!.city.toString(),
                            style: blackFontStyle3,
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                  ////Checkout Botton
                  (isLoading)
                      ? Center(
                          child: loadingIndicator,
                        )
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(
                              defaultMargin, 40, defaultMargin, 0),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width - 100,
                              height: 50,
                              child: TextButton(
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    String? paymentURL = (await context
                                        .read<TransactionCubit>()
                                        .submitTransaction(widget.transaction
                                            .copyWith(
                                                dateTime: DateTime.now(),
                                                total:
                                                    (widget.transaction.total! *
                                                                1.1)
                                                            .toInt() +
                                                        50000)));
                                    debugPrint(paymentURL);

                                    // String? result = await context
                                    //     .read<TransactionCubit>()
                                    //     .submitTransaction(widget.transaction
                                    //         .copyWith(
                                    //             dateTime: DateTime.now(),
                                    //             total:
                                    //                 (widget.transaction.total! *
                                    //                             1.1)
                                    //                         .toInt() +
                                    //                     50000));

                                    // debugPrint(result);

                                    // if (result != null) {
                                    //   Get.to(const SuccesOrderPage());
                                    // } else {
                                    //   setState(() {
                                    //     isLoading = false;
                                    //   });
                                    //   Get.snackbar("", "",
                                    //       backgroundColor: "ff0000".toColor(),
                                    //       icon: const Icon(
                                    //           MdiIcons.closeCircleOutline,
                                    //           color: Colors.white),
                                    //       titleText: Text("Transaction Failed",
                                    //           style: GoogleFonts.poppins(
                                    //             color: Colors.white,
                                    //             fontWeight: FontWeight.w600,
                                    //           )),
                                    //       messageText:
                                    //           Text("Please Try Again Later.",
                                    //               style: GoogleFonts.poppins(
                                    //                 color: Colors.white,
                                    //               )));
                                    // }

                                    if (paymentURL != null) {
                                      Get.to(() => PaymentMethodPage(paymentURL: paymentURL));
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Get.snackbar("", "",
                                          backgroundColor: "ff0000".toColor(),
                                          icon: const Icon(
                                              MdiIcons.closeCircleOutline,
                                              color: Colors.white),
                                          titleText: Text("Transaction Failed",
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              )),
                                          messageText:
                                              Text("Please Try Again Later.",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                  )));
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    backgroundColor: mainColor,
                                  ),
                                  child: Text("Checkout Now",
                                      style: blackFontStyle2))),
                        )
                ],
              ))
        ],
      ),
    );
  }
}
