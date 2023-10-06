import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late List<CameraDescription> cameras;
  late CameraController _controller;
  bool _isCameraOpen = false;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    // _initializeCameraController();
  }

  Future<void> _initializeCameraController() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.high);

    try {
      await _controller.initialize();
    } catch (e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("Access is Denied");
            break;
          default:
            print(e.description);
        }
      }
    }

    if (mounted) {
      setState(() {
        _isCameraOpen = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _captureAndSave() async {
    if (_isProcessing) return;
    setState(() {
      _isProcessing = true;
    });

    try {
      if (_isCameraOpen) {
        final image = await _controller.takePicture();

        // Ottieni la directory dell'applicazione
        final appDir = await getApplicationDocumentsDirectory();
        final imagePath = appDir.path + '/image_${DateTime.now()}.jpg';

        // Sposta l'immagine catturata nella directory dell'applicazione
        final savedImage = await File(image.path).copy(imagePath);

        // Ora puoi fare qualcosa con il percorso dell'immagine salvata
        print('Immagine salvata in: ${savedImage.path}');

        // Ora puoi fare qualcosa con il percorso dell'immagine salvata
        print('Immagine salvata in: ${savedImage.path}');
      }
    } catch (e) {
      print('Errore durante la cattura della foto: $e');
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  Future<void> _closeCamera() async {
    if (_isCameraOpen) {
      await _controller.dispose();
      setState(() {
        _isCameraOpen = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _isCameraOpen
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: CameraPreview(_controller),
                )
              : const SizedBox(),
          ElevatedButton(
            onPressed: _isProcessing || !_isCameraOpen
                ? null
                : () async {
                    if (_isCameraOpen) {
                      await _captureAndSave();
                    }
                  },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return Colors.blue;
              }),
            ),
            child: _isProcessing
                ? const CircularProgressIndicator()
                : const Text('Scatta una foto'),
          ),
          ElevatedButton(
            onPressed: _isCameraOpen
                ? () async {
                    await _closeCamera();
                  }
                : () async {
                    await _initializeCameraController();
                  },
            child: _isCameraOpen
                ? const Text('Chiudi la fotocamera')
                : const Text('Apri la telecamera'),
          ),
        ],
      ),
    );
  }
}
