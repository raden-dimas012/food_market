part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double? rate;
  const RatingStars({Key? key, this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate!.round();

    return Row(
      children: List<Widget>.generate(
              5,
              (index) => Icon(
                    (index < numberOfStars)
                        ? MdiIcons.star
                        : MdiIcons.starOutline,
                    size: 16,
                    color: mainColor,
                  )) +
          [
            const SizedBox(
              width: 4.0,
            ),
            Text(
              rate.toString(),
              style: greyFontStyle.copyWith(fontSize: 12.0),
            ),
          ],
    );
  }
}