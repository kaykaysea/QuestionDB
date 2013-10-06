package com.kaykay.questionDb.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import com.kaykay.questionDb.domain.Exam;

public interface ExamRepository extends MongoRepository<Exam, String> {
	
	@Query("{'name':{$regex:?0,$options:'i'}}")
	List<Exam> findByNameLike(String name);

}
