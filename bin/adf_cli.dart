import 'package:adf_cli/src/commands/students/students_command.dart';
import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  CommandRunner('Adf Cli', 'Adf Cli')
    ..addCommand(StudentsCommand())
    ..run(arguments);
}
