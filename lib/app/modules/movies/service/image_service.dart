import 'dart:convert';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageService {
  Future<String?> compressAndEncodeImage(String imagePath) async {
    try {
      final File imageFile = File(imagePath);
      
      if (!await imageFile.exists()) {
        return null;
      }

      final compressedBytes = await FlutterImageCompress.compressWithFile(
        imagePath,
        quality: 40, 
        minWidth: 400, 
        minHeight: 600, 
      );

      if (compressedBytes == null) {
        return null;
      }

      final base64String = base64Encode(compressedBytes);
      
      return base64String;
    } catch (e) {
      print('Erro ao comprimir e codificar imagem: $e');
      return null;
    }
  }

  List<int>? decodeImage(String base64String) {
    try {
      return base64Decode(base64String);
    } catch (e) {
      print('Erro ao decodificar imagem: $e');
      return null;
    }
  }
}