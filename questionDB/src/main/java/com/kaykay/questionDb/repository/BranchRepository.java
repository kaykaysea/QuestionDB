package com.kaykay.questionDb.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import com.kaykay.questionDb.domain.Branch;

public interface BranchRepository extends MongoRepository<Branch, String> {

	Branch findByName(String branchName);
	
	@Query(value="{ }", fields="{ _class:0,topicList:0}")
	  List<Branch> getAllBranchesIds();

}
