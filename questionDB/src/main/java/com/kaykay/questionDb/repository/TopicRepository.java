package com.kaykay.questionDb.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.kaykay.questionDb.domain.Topic;

public interface TopicRepository extends MongoRepository<Topic, String> {

}
