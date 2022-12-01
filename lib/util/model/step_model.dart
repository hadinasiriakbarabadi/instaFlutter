class StepModel {
  final int id;
  final String text;

  StepModel({required this.id, required this.text});

  static List<StepModel> list = [
    StepModel(
      id: 1,
      text: "آخرین اطلاعات\n معتبر ترین اخبار\n چالشی ترین\n فقط در هوادار",
    ),
    StepModel(
      id: 2,
      text:
          "از تیم و یا شخص قهرمان\n خود حمایت ویژه کنید",
    ),
    StepModel(
      id: 3,
      text: "پک ویژه خود را\n مستقیما از باشگاه بگیرید",
    ),
  ];
}
