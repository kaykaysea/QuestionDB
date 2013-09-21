package com.kaykay.questionDb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaykay.questionDb.domain.Branch;
import com.kaykay.questionDb.repository.BranchRepository;

@Service
public class BranchService {
	
	@Autowired
	BranchRepository branchRepository;
	
	public Branch getBranchById(String id){
		
		return branchRepository.findOne(id);
		
	}
	
	public List<String> getTopicsByBranchId(String id){
		
		return branchRepository.findOne(id).getTopics();
	}

}
