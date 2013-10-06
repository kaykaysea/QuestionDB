package com.kaykay.questionDb.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaykay.questionDb.domain.Exam;
import com.kaykay.questionDb.repository.ExamRepository;

@Service
public class ExamService {
	
	@Autowired
	ExamRepository examRepository;
	
	public List<Exam> getExamsList(){
		
		return examRepository.findAll();
		
	}
	
	public List<Exam> getExamsbyName(String name){
		
		return examRepository.findByNameLike(name);
	}
	
	
	public Exam createExam(Exam exam){
		
		exam.setId(UUID.randomUUID().toString());
		return examRepository.save(exam);
		
	}

}
