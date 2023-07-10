import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_project_bloc/core/usecases/usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/person_entity.dart';
import '../repositories/person_repository.dart';
import 'package:meta/meta.dart';

class SearchPerson extends UseCase<List<PersonEntity>, SearchPersonParams> {
  final PersonRepository personRepository;

  SearchPerson(this.personRepository);

  Future<Either<Failure, List<PersonEntity>>> call(
      SearchPersonParams params) async {
    return await personRepository.searchPerson(params.query);
  }
}

class SearchPersonParams extends Equatable {
  final String query;

  SearchPersonParams({required this.query});

  @override
  List<Object?> get props => [query];
}
