import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class QRScannerMain extends StatefulWidget {
  const QRScannerMain({super.key});

  @override
  State<QRScannerMain> createState() => _QRScannerMainState();
}

class _QRScannerMainState extends State<QRScannerMain> {
  String? qrCodeResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 153, 241),
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Camera",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                IconButton(
                  onPressed: _onCameraScan,
                  icon: Icon(
                    Icons.camera,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Gallery",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                IconButton(
                  onPressed: _onGalleryScan,
                  icon: Icon(
                    Icons.browse_gallery,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            if (qrCodeResult != null) ...[
              Text(
                qrCodeResult!,
                style: TextStyle(color: Colors.white),
              ),
            ]
          ],
        ),
      ),
    );
  }

  void _onCameraScan() {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text("Scan QR Code")),
            body: QrCamera(
              onError: (context, error) => Center(
                child: Text(
                  error.toString(),
                  style: TextStyle(color: Colors.red),
                ),
              ),
              qrCodeCallback: (code) {
                Navigator.pop(context,
                    code); // Pass the scanned code back to the previous screen
              },
            ),
          ),
        ),
      ).then((code) {
        if (code != null) {
          if (mounted) {
            setState(() {
              qrCodeResult = code; // Update the result
            });
          }
          print("QR CODE RESULT From Camera: $qrCodeResult");
        }
      });
    } catch (e) {
      print("Error reading QR code from Camera: $e");
    }
  }

  void _onGalleryScan() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final inputImage = InputImage.fromFilePath(pickedFile.path);
      final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

      try {
        final barcode = await barcodeScanner.processImage(inputImage);
        if (barcode.isNotEmpty) {
          setState(() {
            qrCodeResult = barcode.first.displayValue ?? "No QR data found.";
            print("QR CODE RESULT FROM GALLERY : $qrCodeResult");
          });
        } else {
          setState(() {
            qrCodeResult = "No QR code found.";
          });
        }
      } catch (e) {
        print("Error reading QR code from gallery image: $e");
        setState(() {
          qrCodeResult = "Could not decode QR code.";
        });
      } finally {
        barcodeScanner.close();
      }
    }
  }
}
