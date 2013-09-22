package com.kaykay.questionDb.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import com.kaykay.questionDb.domain.SubTopic;
import com.kaykay.questionDb.domain.Topic;

public interface SubTopicRepository extends MongoRepository<SubTopic, String> {

	@Query("{'name':{$regex:?0,$options:'i'}}")
	List<SubTopic> findByNameLike(String name);
	
}
