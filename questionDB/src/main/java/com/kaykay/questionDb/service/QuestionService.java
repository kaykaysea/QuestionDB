package com.kaykay.questionDb.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaykay.questionDb.domain.Question;
import com.kaykay.questionDb.repository.QuestionRepository;

@Service
public class QuestionService {
	
	@Autowired
	QuestionRepository questionRepository;
	
	
	public Question getQuestionById(String id){
		
		return questionRepository.findOne(id);
		
	}
//	
//	public List findQuestionsByTopic(String Topic){
//		
//		return questionRepository.findQuestionsByTopic(Topic);
//		
//	}
	
	public List<Question> getAllQuestions(){
		return questionRepository.findAll();
	}
	
	
	public Question createQuestion(Question question){
		question.setId(UUID.randomUUID().toString());
		return questionRepository.save(question);
		
	}
	

	
	public Question updateQuestion(Question question){
		
		Question existingQuestion = questionRepository.findQuestionById(question.getId());
		
		if(existingQuestion == null){
			
			return null;
		}
		
			
		return questionRepository.save(question);
		
			
	}
	
	public void deleteQuestionById(String id){
		
		Question existingQuestion = questionRepository.findQuestionById(id);
		
		if(existingQuestion == null){
			
		}
		
		else{
			
			questionRepository.delete(existingQuestion);
		}
		
		
	}
	
	
	

}
