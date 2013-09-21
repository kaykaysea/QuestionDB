package com.kaykay.questionDb.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaykay.questionDb.domain.SubTopic;
import com.kaykay.questionDb.repository.SubTopicRepository;

@Service
public class SubTopicService {
	
	@Autowired
	SubTopicRepository subTopicRepository;
	
	public List<SubTopic> getSubTopicsList(){
		
		return subTopicRepository.findAll();
		
	}
	
	
	public SubTopic createSubTopic(SubTopic subTopic){
		
		subTopic.setId(UUID.randomUUID().toString());
		return subTopicRepository.save(subTopic);
		
		
		
	}

}
