import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hello Flutterinas'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //perzonalizar dialogo
  void odpeDialog(BuildContext context) {
    showDialog(
      barrierDismissible:
          false, //obligar que seleccione una opcion y no se cierra la pabtalla
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Lorem ipsum dolor sit amet, consectetur'),
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
        title: const Text('Snackbars & Dialogs'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton(
            onPressed: () {
              showAboutDialog(context: context, children: [
                const Text(
                    'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet Lorenzo, Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet Lorenzo, Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet Lorenzo, Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet Lorenzo'),
              ]);
            },
            child: const Text(
              'Licencias usadas',
            ),
          ),
          FilledButton(
            onPressed: () => odpeDialog(context),
            child: const Text(
              'Mostrar diálogo',
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(
          Icons.remove_red_eye,
        ),
      ),
    );
  }
}
