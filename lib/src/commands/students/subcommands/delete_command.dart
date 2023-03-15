import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/student_dio_repository.dart';

class DeleteCommand extends Command {
  StudentDioRepository studentRepository;

  @override
  String get description => 'Delete student by id';

  @override
  String get name => 'delete';

  DeleteCommand(this.studentRepository) {
    argParser.addOption('id', help: 'Student id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    final id = int.parse(argResults?['id']);

    if (argResults?['id'] == null) {
      print('Por favor, informe o id do aluno com o comando --id=0 ou -i 0');
      return;
    }

    print('Aguarde buscando Id do Aluno...');

    final student = await studentRepository.findById(id);

    print('Deseja deletar o aluno: ${student.name}? (S/N)');

    final confirmDelete = stdin.readLineSync();

    if (confirmDelete?.toLowerCase() == 's') {
      await studentRepository.deleteById(id);
      print('---------------------------------');
      print('Aluno deletado com sucesso.');
      print('---------------------------------');
    } else {
      print('---------------------------------');
      print('Operação Cancelada!!');
      print('---------------------------------');
      return;
    }
  }
}
