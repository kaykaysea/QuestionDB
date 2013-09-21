package com.kaykay.questionDb.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.kaykay.questionDb.domain.SubTopic;

public interface SubTopicRepository extends MongoRepository<SubTopic, String> {

}
