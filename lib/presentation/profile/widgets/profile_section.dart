import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:silver_heart_buy/bloc/bloc.dart';
import 'package:silver_heart_buy/models/models.dart';
import 'package:silver_heart_buy/theme/app_theme.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key, this.user, this.image, this.isSaving = false})
      : super(key: key);

  final MyUser? user;
  final File? image;
  final bool isSaving;

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  final _nameCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final picker = ImagePicker();

  @override
  void initState() {
    _nameCtrl.text = widget.user?.name ?? 'Agrega un nombre';
    _descriptionCtrl.text =
        widget.user?.description ?? 'Agrega una descripción';
    _addressCtrl.text = widget.user?.address ?? 'Agrega tu dirección';
    _emailCtrl.text = widget.user?.email ??
        FirebaseAuth.instance.currentUser!.email.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset(
      "assets/profile-user.png",
      fit: BoxFit.fill,
    );

    if (widget.image != null) {
      avatar = Image.file(
        widget.image!,
        fit: BoxFit.fill,
      );
    } else if (widget.user?.image != null && widget.user!.image!.isNotEmpty) {
      avatar = CachedNetworkImage(
        imageUrl: widget.user!.image!,
        progressIndicatorBuilder: (_, __, progress) =>
            CircularProgressIndicator(value: progress.progress),
        errorWidget: (_, __, ___) => const Icon(Icons.error),
        fit: BoxFit.fill,
      );
    }

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              final avatarPicked =
                  await picker.pickImage(source: ImageSource.gallery);
              if (avatarPicked != null) {
                // ignore: use_build_context_synchronously
                context.read<UserBloc>().setImage(File(avatarPicked.path));
              }
            },
            child: Center(
              child: ClipOval(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: avatar,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _nameCtrl,
            decoration: const InputDecoration(labelText: 'Nombre'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _descriptionCtrl,
            decoration: const InputDecoration(labelText: 'Descripción'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _addressCtrl,
            keyboardType: TextInputType.streetAddress,
            decoration: const InputDecoration(labelText: 'Dirección'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _emailCtrl,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Correo'),
          ),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: FloatingActionButton.extended(
                  backgroundColor: AppTheme.thirdColor,
                  onPressed: widget.isSaving
                      ? null
                      : () {
                          context.read<UserBloc>().saveUser(
                              (context.read<Authcubit>().state
                                      as AuthStateSuccess)
                                  .user
                                  .uid,
                              _nameCtrl.text.trim(),
                              _descriptionCtrl.text.trim(),
                              _addressCtrl.text.trim(),
                              _emailCtrl.text.trim()
                          );
                        },
                  label: const Text('Guardar información'),
                  icon: const Icon(
                    Icons.edit_outlined,
                  ),
                ),
              ),
              if (widget.isSaving) const CircularProgressIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}
