part of '../screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            // INSTASTORY
            Instastory(
              mapInstastory: InstastoryData.mapInstastory,
            ),

            Divider(height: 3),

            SizedBox(height: 5),

            // FEED
            Feed(
              mapFeed: FeedData.mapFeed,
            ),
          ],
        ),
      ),
    );
  }
}
