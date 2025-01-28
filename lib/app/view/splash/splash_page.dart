import 'package:flutter/material.dart';
import 'package:lista_tareas/app/view/components/shape.dart';
import 'package:lista_tareas/app/view/components/title_custom.dart';
import 'package:lista_tareas/app/view/task_list/task_list_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Shape()
              ],
            ),
            const SizedBox(height: 79),
            Image.asset(
              'assets/images/onboarding-image.png',
              width: 180,
              height: 168,
            ),
            const SizedBox(height: 99),
            TitleCustom('Lista de Tareas'),
            
            const SizedBox(height: 21),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const TaskListPage();
                }));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                    'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
