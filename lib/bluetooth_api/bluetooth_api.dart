import 'dart:convert';

import 'package:flutter_blue/flutter_blue.dart';

class BlueToothApi {
  final flutterBlue = FlutterBlue.instance;
  late final BluetoothDevice device;
  var scanSubscription;
  var deviceFound = false;

  // Editable settings
  var deviceName = 'OrbitCablecam';
  var writeUUID = '0000ffe1-0000-1000-8000-00805f9b34fb';

  BlueToothApi() {
    scanForDevices();
  }

  void scanForDevices() async {
    // First check already connected devices
    flutterBlue.connectedDevices.then((connectedDevices) {
      connectedDevices.forEach((connectedDevice) {
        if (!deviceFound && connectedDevice.name == deviceName) {
          deviceFound = true;
          device = connectedDevice;
          print('FOUND CONNECTED DEVICE.');
        }
      });

      // If no connected device was found,
      // try to connect to a new device
      if (!deviceFound) {
        print('SCANNING FOR NEW DEVICES.');

        // Start scanning
        flutterBlue.startScan(timeout: const Duration(seconds: 30));

        // Listen to scan results
        scanSubscription = flutterBlue.scanResults.listen((results) {
          // do something with scan results
          for (ScanResult r in results) {
            if (r.device.name == deviceName) {
              stopScan();

              deviceFound = true;
              device = r.device;
              device.connect(autoConnect: true);

              print('CONNECTED TO NEW DEVICE.');
            }
          }
        });
      }
    });
  }

  void stopScan() {
    // Stop scanning
    flutterBlue.stopScan();
    scanSubscription.cancel();
  }

  void write(String str) async {
    if (!deviceFound) {
      print('CANT TRANSMIT DATA. NOT CONNECTED TO ANY DEVICE.');
      return;
    }

    List<BluetoothService> services = await device.discoverServices();

    services.forEach((service) async {
      service.characteristics.forEach((char) async {
        if (char.uuid.toString() == writeUUID) {
          print('SENDING DATA TO CONNECTED DEVICE :: $str');
          await char.write(utf8.encode(str), withoutResponse: false);
        }
      });
    });
  }
}
