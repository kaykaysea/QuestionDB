package com.kaykay.questionDb.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.kaykay.questionDb.domain.Question;

public interface QuestionRepository extends MongoRepository<Question, String> {

	List<Question> findQuestionsByTopic(String Topic);
	
	Question findQuestionById(String Id);
}
