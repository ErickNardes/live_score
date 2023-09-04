import 'package:flutter/material.dart';

class CardDetailsMatchLiveWidget extends StatefulWidget {
  final String title;
  final String nameHome;
  final String nameAway;
  final String imageHome;
  final String imageAway;
  final String home;
  final String away;
  final int pointsHome;
  final int pointsAway;
  final int time;
  const CardDetailsMatchLiveWidget({
    Key? key,
    required this.title,
    required this.nameHome,
    required this.nameAway,
    required this.imageHome,
    required this.imageAway,
    required this.home,
    required this.away,
    required this.pointsHome,
    required this.pointsAway,
    required this.time,
  }) : super(key: key);

  @override
  State<CardDetailsMatchLiveWidget> createState() => _CardMatchEntityState();
}

class _CardMatchEntityState extends State<CardDetailsMatchLiveWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.04),
      child: SizedBox(
        height: size.height * 0.3,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.only(
            right: size.width * 0.05,
            left: size.width * 0.05,
          ),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            widget.imageHome,
                            height: size.height * 0.07,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            widget.nameHome,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.04,
                            ),
                          ),
                          Text(
                            widget.home,
                          )
                        ],
                      ),
                    ),
                    Text(
                      widget.pointsHome.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.07,
                      ),
                    ),
                    Text(
                      ' : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.1,
                      ),
                    ),
                    Text(
                      widget.pointsHome.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.07,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.network(
                            widget.imageAway,
                            height: size.height * 0.07,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            widget.nameAway,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.04,
                            ),
                          ),
                          Text(
                            widget.away,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width * 0.12,
                    height: size.width * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 2,
                        color: Colors.pink,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${widget.time.toString()}"',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
