import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

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
    _initializeCamera();
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
                        "Scan Redemption QR Code",
                        style: TextTheme.of(context).labelMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
              : Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2,)),
    );
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized) return;
    XFile image = await _controller!.takePicture();
    print("Picture taken: ${image.path}");
  }
}
