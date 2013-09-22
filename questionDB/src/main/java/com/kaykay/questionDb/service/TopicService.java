package com.kaykay.questionDb.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaykay.questionDb.domain.Topic;
import com.kaykay.questionDb.repository.TopicRepository;

@Service
public class TopicService {

	@Autowired
	TopicRepository topicRepository;
	
	public List<Topic> getTopicsList(){
		
		return topicRepository.findAll();
	}
	
	public List<Topic> getTopicsbyName(String name){
		
		return topicRepository.findByNameLike(name);
	}
	
	public Topic createTopic(Topic topic){
		
		topic.setId(UUID.randomUUID().toString());
		return topicRepository.save(topic);
	}
	
}
