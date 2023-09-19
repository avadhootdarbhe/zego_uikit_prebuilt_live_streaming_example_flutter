// Flutter imports:
import 'package:flutter/material.dart';
import 'package:live_streaming/constants.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

// Project imports:
import 'common.dart';

class LivePage extends StatefulWidget {
  final String liveID;
  final bool isHost;

  const LivePage({
    Key? key,
    required this.liveID,
    this.isHost = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => LivePageState();
}

class LivePageState extends State<LivePage> {
  final liveController = ZegoUIKitPrebuiltLiveStreamingController();
  final audience = ZegoUIKitPrebuiltLiveStreamingAudienceEvents();
  final host = ZegoUIKitPrebuiltLiveStreamingEvents(
    hostEvents: ZegoUIKitPrebuiltLiveStreamingHostEvents(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: 1484647939 /*input your AppID*/,
        appSign:
            'e9b6464b12323c6f835731fbef3f398dbcdfe1ae9261f6be373f7aa7696ab105' /*input your AppSign*/,
        userID: localUserID,
        events: host,
        userName: 'user_$localUserID',
        liveID: widget.liveID,
        controller: liveController,
        config: (widget.isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience())
          ..avatarBuilder = customAvatarBuilder,
      ),
    );
  }
}
