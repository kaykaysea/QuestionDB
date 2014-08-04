package com.kaykay.questionDb.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.kaykay.questionDb.domain.Branch;

public interface BranchRepository extends MongoRepository<Branch, String> {

	Branch findByName(String branchName);
	
	

}
