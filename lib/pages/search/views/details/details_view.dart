import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Start replacing content from here
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5.41,
            children: const [
              Text(
                'Chanel, Inc.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.43,
                ),
              ),
              Opacity(
                opacity: 0.90,
                child: Text(
                  '􀋃 4.3 / 5',
                  style: TextStyle(
                    color: Color(0xBFD0DA57),
                    fontSize: 17.46,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.44,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      // mainAxisSize: MainAxisSize.min,
      // children: const [
      //   Padding(
      //     padding: EdgeInsets.only(top: 26.0),
      //     child: Column(
      //       children: [
      //         Text("Information About Logistics Or Businesses",
      //             style: TextStyle(fontSize: 18.0)),
      //       ],
      //     ),
      //   ),
      // ],
    );
  }
}
