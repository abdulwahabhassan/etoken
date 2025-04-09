import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../features/dashboard/screens/tally_dashboard_screen.dart';
import '../theme/colors.dart';

class CameraScreen extends StatefulWidget {
  final String title;

  const CameraScreen({super.key, required this.title});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraReady = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: black,
      ),
    );
    _initializeCamera()
        .then((value) => transition());
  }

  Future<void> transition() async {
    await Future.delayed(Duration(seconds: 3));
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (buildContext) => TallyDashboardScreen()),
      );
    }
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras![0], ResolutionPreset.medium);
    await _controller!.initialize();
    if (mounted) {
      setState(() => _isCameraReady = true);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          _isCameraReady
              ? Stack(
                children: [
                  Center(
                    child: SizedBox(
                      // height: double.infinity,
                      width: double.infinity,
                      child: CameraPreview(_controller!),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 24,
                    right: 24,
                    child: Center(
                      child: Text(
                        widget.title,
                        style: TextTheme.of(context).labelMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
              : Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
    );
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized) return;
    XFile image = await _controller!.takePicture();
    print("Picture taken: ${image.path}");
  }
}
