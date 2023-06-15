import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 70.0;

class TimelineOrder extends StatelessWidget {
  const TimelineOrder({super.key});

  @override
  Widget build(BuildContext context) {
    List<_TimelineStatus> data = [
      _TimelineStatus.done,
      _TimelineStatus.done,
      _TimelineStatus.done,
      _TimelineStatus.done,
      _TimelineStatus.inProgress,
      _TimelineStatus.inProgress,
      _TimelineStatus.inProgress,
      _TimelineStatus.inProgress,
      _TimelineStatus.todo,
      _TimelineStatus.todo,
      _TimelineStatus.todo,
      _TimelineStatus.todo,
    ];

    return SizedBox(
      height: 500,
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: orangeColor,
          connectorTheme: const ConnectorThemeData(
            thickness: 1.5,
          ),
        ),
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 71),
        builder: TimelineTileBuilder.connected(
          indicatorBuilder: (context, index) {
            // return DotIndicator(
            //   color: data[index].isInProgress ? Color(0xff193fcc) : null,
            // );
            return DotIndicator(
              color: orangeColor,
            );
          },
          connectorBuilder: (_, index, connectorType) {
            // var color;
            // if (index + 1 < data.length - 1) {
            //   color = data[index].isInProgress && data[index + 1].isInProgress
            //       ? Color(0xff193fcc)
            //       : null;
            // }
            return SolidLineConnector(
              indent: connectorType == ConnectorType.start ? 0 : 2.0,
              endIndent: connectorType == ConnectorType.end ? 0 : 2.0,
              // color: color,
              color: orangeColor,
            );
          },
          contentsBuilder: (_, index) => _EmptyContents(
            title: "Status $index",
            time: "Time $index",
          ),
          itemExtentBuilder: (_, __) {
            return kTileHeight;
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}

class _EmptyContents extends StatelessWidget {
  const _EmptyContents({
    required this.title,
    required this.time,
  });

  final String title;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      height: 70.0,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(2.0),
      //   color: Color(0xffe6e7e9),
      // ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: orangeTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Text(
            time,
            style: mutedTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

enum _TimelineStatus {
  done,
  // sync,
  inProgress,
  todo,
}

extension on _TimelineStatus {
  // bool get isInProgress => this == _TimelineStatus.inProgress;
}
