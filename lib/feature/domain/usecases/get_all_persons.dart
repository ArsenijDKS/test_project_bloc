import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_project_bloc/core/usecases/usecase.dart';
import 'package:test_project_bloc/feature/domain/repositories/person_repository.dart';
import '../../../core/error/failure.dart';
import '../entities/person_entity.dart';

class GetAllPersons extends UseCase<List<PersonEntity>, PagePersonParams> {
  final PersonRepository personRepository;

  GetAllPersons(this.personRepository);

  Future<Either<Failure, List<PersonEntity>>> call(
      PagePersonParams params) async {
    return await personRepository.getAllPersons(params.page);
  }
}

class PagePersonParams extends Equatable {
  final int page;

  PagePersonParams({required this.page});

  @override
  List<Object?> get props => [page];
}
