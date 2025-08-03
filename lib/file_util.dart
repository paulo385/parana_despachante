import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileUtil {
  Future<void> downloadFile(
      String url, String fileName, BuildContext context) async {
    print("url: $url");
    print("fileName: $fileName");

    Dio dio = Dio();

    // Verifica e solicita permissão
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permissão negada para armazenamento')),
      );
      return;
    }

    try {
      // Pega diretório de download
      Directory? dir = Platform.isAndroid
          ? await getExternalStorageDirectory() // Android
          : await getApplicationDocumentsDirectory(); // iOS/macOS

      String savePath = "${dir!.path}/$fileName";

      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print("Progresso: ${(received / total * 100).toStringAsFixed(0)}%");
          }
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download concluído: $savePath')),
      );


    // Abrir o arquivo após o download
    final result = await OpenFile.open(savePath);
    print("Resultado da abertura: ${result.message}");

    } catch (e) {
      print("Erro no download: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao baixar o arquivo')),
      );
    }
  }
}
