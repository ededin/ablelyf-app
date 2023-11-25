
import 'package:video_player/video_player.dart';

import '../../../../ablelyf.dart';

class VideoPlayershow extends StatefulWidget {
  const VideoPlayershow({super.key});

  @override
  State<VideoPlayershow> createState() => _VideoPlayershowState();
}

class _VideoPlayershowState extends State<VideoPlayershow> {
  bool isLoading = true;
  bool isRecording = false;
  CameraController? cameraController;
  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CameraPreview(cameraController!),
            Padding(
              padding: EdgeInsets.all(25),
              child: FloatingActionButton(
                // shape: BeveledRectangleBorder(
                //     borderRadius: BorderRadius.circular(100.0)),
                backgroundColor: Colors.red,
                child: Icon(isRecording ? Icons.stop : Icons.circle),
                onPressed: () => recordVideo(),
              ),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    cameraController = CameraController(front, ResolutionPreset.max);
    await cameraController?.initialize();
    setState(() => isLoading = false);
  }

  recordVideo() async {
    if (isRecording) {
      final file = await cameraController?.stopVideoRecording();
      setState(() => isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPreviewPage(filePath: file!.path),
      );
      Navigator.push(context, route);
    } else {
      await cameraController?.prepareForVideoRecording();
      await cameraController?.startVideoRecording();
      setState(() => isRecording = true);
    }
  }
}

class VideoPreviewPage extends StatefulWidget {
  const VideoPreviewPage({super.key, required this.filePath});
  final String filePath;

  @override
  State<VideoPreviewPage> createState() => _VideoPreviewPageState();
}

class _VideoPreviewPageState extends State<VideoPreviewPage> {
  late VideoPlayerController videoPlayerController;

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  Future initVideoPlayer() async {
    videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await videoPlayerController.initialize();
    await videoPlayerController.setLooping(true);
    await videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        elevation: 0,
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              print('do something with the file');
            },
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: initVideoPlayer(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return VideoPlayer(videoPlayerController);
          }
        },
      ),
    );
  }
}
