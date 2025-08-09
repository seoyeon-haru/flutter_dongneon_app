import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class StorageRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadProfileImage({
    required File image,
    required String userId,
  }) async {
    final fileExtension = image.path.split('.').last;
    final fileName = '${const Uuid().v4()}.$fileExtension';
    final ref =
        _storage.ref().child('profile_images').child(userId).child(fileName);
    final uploadTask = await ref.putFile(image);
    final downloadUrl = await uploadTask.ref.getDownloadURL();
    return downloadUrl;
  }
}

final storageRepositoryProvider = Provider((ref) => StorageRepository());
