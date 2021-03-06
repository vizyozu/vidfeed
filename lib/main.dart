import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videofeed/videos/_BumbleBeeRemoteVideo1.dart';
import 'package:videofeed/videos/_BumbleBeeRemoteVideo3.dart';
import 'package:videofeed/videos/_BumbleBeeRemoteVideo5.dart';
// cd /Users/ViS/YoZu/videofeed/build/web/
// git add .
// git commit -m "first commit" .
// git status
// git remote add origin https://github.com/vizyozu/website.git
// git push -u origin main

// flutter build web --release --web-renderer canvaskit
// flutter build web --release --web-renderer html
// flutter run -d chrome --web-renderer canvaskit

// https://www.youtube.com/watch?v=vxFYfumAAlY
// https://www.youtube.com/watch?v=EwBK_cXUTZI
// https://www.youtube.com/watch?v=rFdbY_V7vIo

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyBanhzVBbUXYNvoFHeruTnw5mOmQhsreZQ",
      appId: "1:656927540812:web:b715aabbd74424eefdd6e9",
      messagingSenderId: "656927540812",
      projectId: "videofeedback-911b0",
      databaseURL: 'https://videofeedback-911b0-default-rtdb.firebaseio.com'
    ),
  );
  //initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurpleAccent,
          secondary: Colors.deepPurple,
        ),
        primaryColor: Colors.deepPurpleAccent,
      ),
      home: _App(),
    ),
  );
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          key: const ValueKey<String>('home_page'),
          appBar: AppBar(
            title: const Text('YoZu Video Feedback'),
            actions: <Widget>[
              IconButton(
                key: const ValueKey<String>('push_tab'),
                icon: const Icon(Icons.navigation),
                onPressed: () {
                  // Navigator.push<_PlayerVideoAndPopPage>(
                  //   context,
                  //   MaterialPageRoute<_PlayerVideoAndPopPage>(
                  //     builder: (BuildContext context) => _PlayerVideoAndPopPage(),
                  //   ),
                  // );
                },
              )
            ],
            bottom: const TabBar(
              isScrollable: true,
              tabs: <Widget>[
                // Tab(
                //   icon: Icon(Icons.cloud),
                //   text: "Remote",
                // ),
                // Tab(icon: Icon(Icons.insert_drive_file), text: "Asset"),
                Tab(icon: Icon(Icons.list), text: "Videos List"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
          //    _BumbleBeeRemoteVideo(),
          //    https://www.youtube.com/watch?v=vxFYfumAAlY
          //    _ButterFlyAssetVideo(),
              _ButterFlyAssetVideoInList(),
            ],
          ),
        ),
      );
  }
}

class _ButterFlyAssetVideoInList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ListView(
      shrinkWrap: true,
      children: <Widget>[

        Card(
            child: Column(children: <Widget>[
              Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.adjust_rounded),
                    title: Text("What is Acceleration ? ",style: TextStyle(
                      fontFamily: 'Airbnb',
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),),
                  ),
                  Stack(
                      alignment: FractionalOffset.bottomRight +
                          const FractionalOffset(-0.1, -0.1),
                      children: <Widget>[
                        BumbleBeeRemoteVideo1(),
                     //   Image.asset('assets/flutter-mark-square-64.png'),
                      ]),
                ],
              ),
            ])
        ),
        Card(
            child: Column(children: <Widget>[
              Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.adjust_rounded),
                    title: Text("Reflection of Light - What are Real and Virtual Images ? ",style: TextStyle(
                      fontFamily: 'Airbnb',
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),),
                  ),
                  Stack(
                      alignment: FractionalOffset.bottomRight +
                          const FractionalOffset(-0.1, -0.1),
                      children: <Widget>[
                        BumbleBeeRemoteVideo3(),
                       // Image.asset('assets/flutter-mark-square-64.png'),
                      ]),
                ],
              ),
            ])
        ),
        Card(
            child: Column(children: <Widget>[
              Column(
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.adjust_rounded),
                    title: Text("Are Mass and Weight the same thing ? ",style: TextStyle(
                      fontFamily: 'Airbnb',
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),),
                  ),
                  Stack(
                      alignment: FractionalOffset.bottomRight +
                          const FractionalOffset(-0.1, -0.1),
                      children: <Widget>[
                        BumbleBeeRemoteVideo5(),
                      //  Image.asset('assets/flutter-mark-square-64.png'),
                      ]),
                ],
              ),
            ])
        ),

        // _ExampleCard(title: "Item a"),
        // _ExampleCard(title: "Item b"),
        // _ExampleCard(title: "Item c"),
        // _ExampleCard(title: "Item d"),
        // _ExampleCard(title: "Item e"),
        // _ExampleCard(title: "Item f"),
        // _ExampleCard(title: "Item g"),
        // Card(
        //     child: Column(children: <Widget>[
        //       Column(
        //         children: <Widget>[
        //           const ListTile(
        //             leading: Icon(Icons.cake),
        //             title: Text("Video video"),
        //           ),
        //           Stack(
        //               alignment: FractionalOffset.bottomRight +
        //                   const FractionalOffset(-0.1, -0.1),
        //               children: <Widget>[
        //                 _ButterFlyAssetVideo(),
        //                 Image.asset('assets/flutter-mark-square-64.png'),
        //               ]),
        //         ],
        //       ),
        //     ])),
        // _ExampleCard(title: "Item h"),
        // _ExampleCard(title: "Item i"),
        // _ExampleCard(title: "Item j"),
        // _ExampleCard(title: "Item k"),
        // _ExampleCard(title: "Item l"),
      ],
    );

  }
}

class _BumbleBeeRemoteVideo extends StatefulWidget {
  @override
  _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
}

class _BumbleBeeRemoteVideoState extends State<_BumbleBeeRemoteVideo> {
  late VideoPlayerController _controller;

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/bumble_bee_captions.vtt');
    return WebVTTCaptionFile(
        fileContents); // For vtt files, use WebVTTCaptionFile
  }

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //   'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    //   closedCaptionFile: _loadCaptions(),
    //   videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    // );
    //
    // _controller.addListener(() {
    //   setState(() {});
    // });
    // _controller.setLooping(true);
    // _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 20.0)),
          const Text('With remote mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  ClosedCaption(text: _controller.value.caption.text),
                  ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ControlsOverlay extends StatelessWidget {
  const ControlsOverlay({Key? key, required this.controller})
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

class _PlayerVideoAndPopPage extends StatefulWidget {
  @override
  _PlayerVideoAndPopPageState createState() => _PlayerVideoAndPopPageState();
}

class _PlayerVideoAndPopPageState extends State<_PlayerVideoAndPopPage> {
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset('assets/Butterfly-209.mp4');
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: Center(
        child: FutureBuilder<bool>(
          future: started(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              );
            } else {
              return const Text('waiting for video to load');
            }
          },
        ),
      ),
    );
  }
}

