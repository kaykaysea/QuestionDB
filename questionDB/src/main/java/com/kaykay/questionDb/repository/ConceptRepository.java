package com.kaykay.questionDb.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.kaykay.questionDb.domain.Concept;

public interface ConceptRepository extends MongoRepository<Concept, String> {

}
