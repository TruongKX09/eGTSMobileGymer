import 'dart:async';

import 'package:egtsv1/src/common_data.dart';
import 'package:egtsv1/src/models/schedule_gymer_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../ultils/theme.dart';

class DetailExcercisePTPage extends StatefulWidget {
  final Excercises dataExcercisePt;
  const DetailExcercisePTPage({super.key, required this.dataExcercisePt});

  @override
  State<DetailExcercisePTPage> createState() => _DetailExcercisePTPageState();
}

class _DetailExcercisePTPageState extends State<DetailExcercisePTPage> {
  late VideoPlayerController videoPlayerCtl;
  late Future<void> initializeVideoPlayerFuture;
  double videoHeight = 420;
  double videoWidth = 360;
  bool _onTouch = false;
  Timer? _timer;
  @override
  void initState() {
    videoInitial(widget.dataExcercisePt.video);
    super.initState();
  }

  bool isVideoUrl(url) {
    return url.toString().contains("http");
  }

  void videoInitial(url) {
    if (isVideoUrl(url)) {
      videoPlayerCtl = VideoPlayerController.networkUrl(
        Uri.parse(url),
      );
      initializeVideoPlayerFuture =
          videoPlayerCtl.initialize().whenComplete(() {
        setState(() {});
      });

      videoPlayerCtl.setLooping(true);
      videoPlayerCtl.play();
    } else {
      videoPlayerCtl = VideoPlayerController.networkUrl(
        Uri.parse("None"),
      );
      initializeVideoPlayerFuture = videoPlayerCtl.initialize();
    }
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    videoPlayerCtl.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Chi Tiết Bài Tập',
          style: namePKStyle,
        )),
        backgroundColor: const Color(0xffcbb682),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            if (isVideoUrl(widget.dataExcercisePt.video))
              SizedBox(
                width: CommonData().getScreenWidth(context, resize: 100),
                child: videoPlayerCtl.value.isInitialized
                    ? InkWell(
                        onTap: () {
                          _onTouch = true;
                          // pause while video is playing, play while video is pausing
                          videoPlayerCtl.value.isPlaying
                              ? videoPlayerCtl.pause()
                              : videoPlayerCtl.play();
                          _timer?.cancel();
                          _timer = Timer.periodic(
                              const Duration(milliseconds: 1000), (_) {
                            setState(() {
                              _onTouch = false;
                            });
                          });
                          setState(() {});
                        },
                        child: AspectRatio(
                          aspectRatio: videoPlayerCtl.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: Stack(children: <Widget>[
                            VideoPlayer(videoPlayerCtl),
                            Visibility(
                              visible: _onTouch,
                              child: Container(
                                color: Colors.grey.withOpacity(0.5),
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(
                                        side: BorderSide(color: Colors.white)),
                                    padding: const EdgeInsets.all(20),
                                  ),
                                  child: Icon(
                                    videoPlayerCtl.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    videoPlayerCtl.value.isPlaying
                                        ? videoPlayerCtl.pause()
                                        : videoPlayerCtl.play();
                                    setState(() {});
                                    _timer?.cancel();
                                    // Auto dismiss overlay after 1 second
                                    _timer = Timer.periodic(
                                        const Duration(milliseconds: 1000),
                                        (_) {
                                      setState(() {
                                        _onTouch = false;
                                      });
                                    });
                                  },
                                ),
                              ),
                            )
                          ]),
                        ),
                      )
                    :
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 52,
                  width: 350,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Tên Bài Tập: ${widget.dataExcercisePt.name}',
                      style: namePKStyle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 52,
                  width: 350,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "Số Lượng-Thời Gian: ${widget.dataExcercisePt.repTime} ${widget.dataExcercisePt.unitOfMeasurement}",
                      style: titleStyle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 52,
                  width: 350,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "Năng Lượng Tiêu Thụ: ${widget.dataExcercisePt.calorieCumsumption} Calories ",
                      style: nameExStyle,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 10, 0),
                    child: Text(
                      "Mô Tả Bài Tập: \n${widget.dataExcercisePt.description!.replaceAll('.', '.\n  ')}",
                      style: titleStyle,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
