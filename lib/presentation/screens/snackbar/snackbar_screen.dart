import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text(
            'Consectetur eiusmod laborum elit non cillum veniam non. Excepteur pariatur amet ex nostrud occaecat mollit commodo mollit ullamco qui consectetur irure est. Excepteur ipsum sint qui laborum ullamco mollit veniam.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Consequat et incididunt aute velit consequat aliqua incididunt veniam mollit dolor esse irure exercitation. Duis anim id nulla proident occaecat Lorem occaecat non dolore ipsum dolore. Labore velit anim aute incididunt sunt minim ipsum. Non voluptate proident mollit Lorem dolore do dolore officia magna laborum aliqua dolore officia minim. Sit anim veniam Lorem minim esse ex magna exercitation minim. Incididunt aliqua mollit magna est. Id esse anim fugiat velit non incididunt adipisicing dolor id duis excepteur est.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar dialogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnackbar(context),
          icon: const Icon(Icons.remove_red_eye_outlined),
          label: const Text('Mostrar snackbar')),
    );
  }
}
