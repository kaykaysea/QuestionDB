package com.kaykay.questionDb.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import com.kaykay.questionDb.domain.Concept;
import com.kaykay.questionDb.domain.SubTopic;

public interface ConceptRepository extends MongoRepository<Concept, String> {
	
	@Query("{'name':{$regex:?0,$options:'i'}}")
	List<Concept> findByNameLike(String name);

}
