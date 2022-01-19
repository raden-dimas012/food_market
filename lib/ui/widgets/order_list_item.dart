part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  const OrderListItem(
      {Key? key, required this.transaction, required this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(transaction.food!.picturePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182, //(60 + 12 + 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food!.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                "${transaction.quantity} item(s)  " +
                    NumberFormat.currency(
                            symbol: "IDR ", decimalDigits: 0, locale: "id-ID")
                        .format(transaction.total),
                style: greyFontStyle.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(convertDateTime(transaction.dateTime!), style: greyFontStyle.copyWith(fontSize: 12),),
              (transaction.status == TransactionStatus.cancelled)
                  ? Text("Cancelled",
                      style: GoogleFonts.poppins(
                          color: "D943SE".toColor(), fontSize: 10))
                  : (transaction.status == TransactionStatus.pending)
                      ? Text("Pending",
                          style: GoogleFonts.poppins(
                              color: "ff0000'".toColor(), fontSize: 10))
                      : (transaction.status == TransactionStatus.onDelivery)
                          ? Text("On Delivery",
                              style: GoogleFonts.poppins(
                                  color: "1ABC9C".toColor(), fontSize: 10))
                          : const SizedBox()
            ],
          ),
        )
      ],
    );
  }

  String convertDateTime(DateTime dateTime) {
    String? month;
    switch (dateTime.month) {
      case 1:
        month = "Jan";
        break;
      case 2:
        month = "Feb";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "Apr";
        break;
      case 5:
        month = "may";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "Aug";
        break;
      case 9:
        month = "Sep";
        break;
      case 10:
        month = "Oct";
        break;
      case 11:
        month = "Nov";
        break;
      case 12:
        month = "Des";
        break;
      default:
    }
    return month! + " ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}";
  }
}