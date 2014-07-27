package com.kaykay.questionDb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaykay.questionDb.domain.Branch;
import com.kaykay.questionDb.domain.Concept;
import com.kaykay.questionDb.domain.Topic;
import com.kaykay.questionDb.repository.BranchRepository;

@Service
public class BranchService {
	
	@Autowired
	BranchRepository branchRepository;
	
	public Branch getBranchById(String id){
		
		return branchRepository.findOne(id);
		
	}
	
//	public List<Topic> getTopicsByBranchId(String id){
//		
//		return branchRepository.findOne(id).getTopicList();
//	}
	
	public List<Branch> getAllBranches(){
		
		return branchRepository.findAll();
	}
	
	
	public Branch createBranch(Branch branch){
			
			//branch.setId(branch.getName().replaceAll(" ", ""));
			return branchRepository.save(branch);
			
	}
	
	public void deleteBranch(String id){
		
		branchRepository.delete(id);
	}
	
	
	public Branch updateBranch(Branch branch){
		
		Branch branch1 = getBranchById(branch.getId());
		branch1.setName(branch.getName());
		return branchRepository.save(branch1);
		
	}
	
	public HashMap<String, Topic> getTopicsByBranch(String id){
	
		Branch branch = branchRepository.findOne(id);
		
		return branch.getTopicList();
		
		
		
	}
	
	public List<Topic> getTopicsListByBranch(String branchName){
		
		//assuming that branchName is same as branch Id. works well provided name has no spaces
		Branch branch = branchRepository.findOne(branchName);
		
		HashMap<String,Topic> topicsMap = branch.getTopicList();
		ArrayList<Topic> topicsList = new ArrayList<Topic>();
		topicsList.addAll(topicsMap.values());
		
		return topicsList; 
		
		
		
	}
	
		

}
