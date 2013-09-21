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
		
		existingQuestion.setConcepts(question.getConcepts());
		existingQuestion.setContent(question.getContent());
		existingQuestion.setOption1(question.getOption1());
		existingQuestion.setOption2(question.getOption2());
		existingQuestion.setOption3(question.getOption3());
		existingQuestion.setOption4(question.getOption4());
		
		return questionRepository.save(existingQuestion);
		
		
		
		
		
		
	}
	

}
