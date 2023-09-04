// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StatisticsProgressWidget extends StatelessWidget {
  final String label;
  final int valueHome;
  final int valueAway;
  final bool isString;
  const StatisticsProgressWidget({
    Key? key,
    required this.label,
    required this.valueHome,
    required this.valueAway,
    required this.isString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progressValue = valueHome / 30;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
          right: size.width * 0.02,
          left: size.width * 0.02,
          top: size.height * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isString ? '${valueHome.toString()} %' : valueHome.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: size.width * 0.05,
                ),
              ),
              Text(
                isString ? '${valueAway.toString()} %' : valueAway.toString(),
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: size.height * 0.01,
                  child: LinearProgressIndicator(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    value: progressValue,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Expanded(
                child: SizedBox(
                  height: size.height * 0.01,
                  child: LinearProgressIndicator(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20),
                    value: progressValue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
