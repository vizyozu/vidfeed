import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../starCreate.dart';

class BumbleBeeRemoteVideo3 extends StatefulWidget {
  @override
  _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
}

class _BumbleBeeRemoteVideoState extends State<BumbleBeeRemoteVideo3> {

  int? _exprating;
  bool? reviewd;
  FocusNode? _commentFocusNode;
  late DatabaseReference _counterRef;
  late VideoPlayerController _controller;
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
    _controller = VideoPlayerController.asset(
      "assets/videos/Reflection_Memorise.mp4",
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> init() async {

    _counterRef = FirebaseDatabase.instance.reference();
  }

  void SaveReview(){
    String review = _commentController.text;
    String rating = _exprating.toString();
    Map<String,String> _reviewMap = {
      'Review':review,
      'Rateing': rating,
      'type':'Acceleration_Motion'
    };

    _counterRef.child('Reflection_Memorise/Reviews/'
        +DateTime.now().millisecondsSinceEpoch.toString())
        .set(_reviewMap).then((value) => setState(() {
      _exprating= 0;
      _commentController.clear();
    }),);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
        //  Container(padding: const EdgeInsets.only(top: 20.0)),
        //  const Text('Reflection of Light - What are Real and Virtual Images ? '),
          Container(
            padding: const EdgeInsets.all(20),
            // child: AspectRatio(
            //   aspectRatio: _controller.value.aspectRatio,
            //   child: Stack(
            //     alignment: Alignment.bottomCenter,
            //     children: <Widget>[
            //       VideoPlayer(_controller),
            //       ClosedCaption(text: _controller.value.caption.text),
            //       _ControlsOverlay(controller: _controller),
            //       VideoProgressIndicator(_controller, allowScrubbing: true),
            //     ],
            //   ),
            // ),
            child: Container(
              height: 200,
              // aspectRatio: _controller.value.aspectRatio/4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  ClosedCaption(text: _controller.value.caption.text),
                  _ControlsOverlay(controller: _controller),
                //  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        //  if(reviewd)...[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Flexible(
                    child: Text(
                      'How would you rate this Video ? ',
                      style: TextStyle(
                        fontFamily: 'Airbnb',
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  //CustomDividerFiller(margin: EdgeInsets.only(left: 16)),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Rating((rating) {
                    setState(() {
                      _exprating = rating;
                    });
                  }, 5),
                  SizedBox(
                      height: 24,
                      child: (_exprating != null && _exprating != 0)
                          ? (_exprating == 5)
                          ? const Text("Very clearly !",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ))
                          : (_exprating == 4)
                          ? const Text("Yes !",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ))
                          : (_exprating == 3)
                          ? const Text("Satisfactorily !",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight:
                            FontWeight.bold,
                            fontSize: 16,
                          ))
                          : (_exprating == 2)
                          ? const Text("Little bit !",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight:
                            FontWeight.bold,
                            fontSize: 16,
                          ))
                          : (_exprating == 1)
                          ? const Text("No !",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight:
                            FontWeight.bold,
                            fontSize: 16,
                          ))
                          : const SizedBox.shrink()
                          : const SizedBox.shrink()
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.all(15),
              height: 80.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, -2),
                    blurRadius: 6.0,
                  ),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  focusNode: _commentFocusNode,
                  controller: _commentController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    contentPadding: const EdgeInsets.all(15.0),
                    hintText: 'Add a comment',
                    // prefixIcon: Container(
                    //   margin: const EdgeInsets.all(4.0),
                    //   width: 48.0,
                    //   height: 48.0,
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black45,
                    //         offset: Offset(0, 2),
                    //         blurRadius: 6.0,
                    //       ),
                    //     ],
                    //   ),
                    //   child: const CircleAvatar(
                    //     child: ClipOval(
                    //       child: Image(
                    //         height: 48.0,
                    //         width: 48.0,
                    //         //image: AssetImage(widget.post.authorImageUrl),
                    //         image: NetworkImage(
                    //             'https://files.slack.com/files-pri/T021665RS3A-F03234F21D4/img-20220209-wa0000.jpg'
                    //           // 'https://media-exp1.licdn.com/dms/image/C4D0BAQEdZ4mEzC4UAg/company-logo_200_200/0/1642775241696?e=1652313600&v=beta&t=YKZXrMZP2yxv1xAy8gioeHelhOBOCBPV8T-09AKKgI8'
                    //         ),
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    suffixIcon: Container(
                      margin: EdgeInsets.only(right: 4.0),
                      width: 60.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.deepPurpleAccent,
                        onPressed: () =>
                        {
                          SaveReview(),

                          FocusScope.of(context).unfocus(),
                        },
                        child: const Icon(
                          Icons.send,
                          size: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

         // ]



        ],
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const _exampleCaptionOffsets = [
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration(milliseconds: 0),
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (context) {
              return [
                for (final offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (context) {
              return [
                for (final speed in _examplePlaybackRates)
                  PopupMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}