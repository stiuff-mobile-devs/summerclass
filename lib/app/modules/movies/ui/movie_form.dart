import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:summerclass/app/modules/movies/controller/movies_controller.dart';

class MovieForm extends GetView<MoviesController> {
  MovieForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicione um novo filme'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome do filme'),
                  textInputAction: TextInputAction.next,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Informe o nome do filme'
                      : null,
                  onSaved: (v) =>
                      controller.movieForm['title'] = v?.trim() ?? '',
                ),
                SizedBox(height: 12),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                  textInputAction: TextInputAction.next,
                  maxLines: 2,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Informe a descrição'
                      : null,
                  onSaved: (v) =>
                      controller.movieForm['description'] = v?.trim() ?? '',
                ),
                SizedBox(height: 12),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Diretores'),
                  textInputAction: TextInputAction.next,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Informe os diretores'
                      : null,
                  onSaved: (v) =>
                      controller.movieForm['directors'] = v?.trim() ?? '',
                ),
                SizedBox(height: 12),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Sinopse'),
                  maxLines: 4,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Informe a sinopse'
                      : null,
                  onSaved: (v) =>
                      controller.movieForm['synopsis'] = v?.trim() ?? '',
                ),
                SizedBox(height: 12),

                ValueListenableBuilder<XFile?>(
                  valueListenable: controller.imageNotifier,
                  builder: (context, file, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Imagem (opcional)',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: controller.pickImage,
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: file == null
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.photo_library,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          'Toque para escolher uma imagem da galeria',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.file(
                                        File(file.path),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    final formState = _formKey.currentState;
                    if (formState != null && formState.validate()) {
                      formState.save();
                      controller.imageNotifier.value = null;
                      print(controller.movieForm);
                      Get.back();
                      Get.snackbar(
                        'Sucesso',
                        'Filme adicionado',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      Get.snackbar(
                        'Erro',
                        'Preencha os campos obrigatórios',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
