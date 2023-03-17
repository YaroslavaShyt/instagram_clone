import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Reels extends StatefulWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  final VideoPlayerController videoController =
      VideoPlayerController.asset('images/video.mp4');
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoController,
      autoInitialize: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Reels',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Icon(Icons.camera_alt_outlined, color: Colors.white)),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(children: <Widget>[
          Chewie(
            controller: chewieController,
          ),
          Padding(
              padding:  const EdgeInsets.fromLTRB(0, 400, 0, 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){}, icon:  const Icon(Icons.favorite_border)),
                  ])),
          Padding(
              padding:  const EdgeInsets.fromLTRB(0, 450, 0, 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){}, icon:  const Icon(Icons.comment_outlined)),
                  ])),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 500, 0, 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){}, icon:  const Icon(Icons.send)),
                  ])),
          Padding(
              padding:  const EdgeInsets.fromLTRB(10, 660, 0, 0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('images/avatar.jpg'),
                      ),
                      const  Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 3),
                          child: Text('yaroslavashyt')),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side:  const BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          child:  const Text('Стежити'))
                    ]),
                    const Expanded(
                      child: Text('Raindbow after the rain'),
                    ),
                  ]))
        ]));
  }
}
