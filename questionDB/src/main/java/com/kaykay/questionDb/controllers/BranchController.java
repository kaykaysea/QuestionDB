package com.kaykay.questionDb.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaykay.questionDb.domain.Branch;
import com.kaykay.questionDb.domain.Concept;
import com.kaykay.questionDb.domain.SubTopic;
import com.kaykay.questionDb.domain.Topic;
import com.kaykay.questionDb.repository.BranchRepository;
import com.kaykay.questionDb.service.BranchService;

@Controller
@RequestMapping("branch")
public class BranchController {
	
	@Autowired
	BranchService branchService;
	
	@Autowired	
	BranchRepository branchRepository;

	@RequestMapping("new")
	public String newBranch(ModelMap model){
		
		model.addAttribute("BRANCH", new Branch());
		model.addAttribute("BRANCH_LIST",branchService.getAllBranches());
		model.addAttribute("TOPIC", new Topic());
		model.addAttribute("SUBTOPIC", new SubTopic());
		model.addAttribute("CONCEPT", new Concept());
		
		return "branchPage";
		
		
	}
	
	@RequestMapping("edit")
	public String editBranch(ModelMap model){
		
		model.addAttribute("BRANCH", new Branch());
		model.addAttribute("BRANCH_LIST",branchService.getAllBranches());
		model.addAttribute("TOPIC", new Topic());
		model.addAttribute("SUBTOPIC", new SubTopic());
		model.addAttribute("CONCEPT", new Concept());
		
		return "editBranchPage";
		
		
	}
	
	
	@RequestMapping("create")
	@ResponseBody
	public Branch createBranch(@RequestBody Branch branch){
		
			return branchService.createBranch(branch);
		
		
	}
	
	
	@RequestMapping("all")
	@ResponseBody
	public List<Branch> allBranches(){
		
		return branchService.getAllBranches();
		
		
	}
	
	@RequestMapping("{id}/topics")
	@ResponseBody
	public List<Topic> topicsByBranch(@PathVariable("id") String id){
		
		HashMap<String,Topic> topicsMap = new HashMap<String, Topic>();
		topicsMap = branchService.getTopicsByBranch(id);
		List<Topic> topicList = new ArrayList<Topic>();
		if(topicsMap!=null){
			topicList.addAll(topicsMap.values());
		}
		
		
		Collections.sort(topicList);
		return topicList;
		
		
	}
	
	
	@RequestMapping("{branchId}/{topicId}/{subTopicId}/concepts")
	@ResponseBody
	public List<Concept> conceptsBySubTopic(@PathVariable("branchId") String branchId,
											@PathVariable("topicId") String topicId,
											@PathVariable("subTopicId") String subTopicId) {
		
		String topicId_dec = "";
		String subTopicId_dec = "";
		
	    try {
			topicId_dec = URLDecoder.decode(topicId, "UTF-8");
			subTopicId_dec = URLDecoder.decode(subTopicId, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		SubTopic subTopic = branchService.getTopicsByBranch(branchId).get(topicId_dec).getSubTopicList().get(subTopicId_dec);
		
		HashMap<String,Concept> conceptsMap = subTopic.getConceptMap();
		
		List<Concept> conceptList = new ArrayList<Concept>();
		
		if(conceptsMap!=null){
			
			conceptList.addAll(conceptsMap.values());
		}
		
		Collections.sort(conceptList);
		
		return conceptList;
		
	}
 	
	
	@RequestMapping("{branchId}/{topicId}/subTopics")
	@ResponseBody
	public List<SubTopic> subTopicsByTopic(@PathVariable("branchId") String branchId,@PathVariable("topicId") String topicId) {
		
		String topicId_dec = "";
		
	    try {
			topicId_dec = URLDecoder.decode(topicId, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Topic topic = branchService.getTopicsByBranch(branchId).get(topicId_dec);
		
		HashMap<String,SubTopic> subTopicsMap = topic.getSubTopicList();
		
		List<SubTopic> subTopicList = new ArrayList<SubTopic>();
		
		if(subTopicsMap!=null){
			
			subTopicList.addAll(subTopicsMap.values());
		}
		
		Collections.sort(subTopicList);
		
		return subTopicList;
		
	}
	
	
	@RequestMapping(value="{branchId}/addTopic",method=RequestMethod.POST)
	@ResponseBody
	public Branch addTopicToBranch(@PathVariable("branchId") String branchId, @RequestBody Topic topic){
		
		Branch branch = branchService.getBranchById(branchId);
		HashMap<String, Topic> topicMap = new HashMap<String, Topic>();
		
		if(branch.getTopicList()!=null){
			topicMap = branch.getTopicList();
			
		}
		
    	topicMap.put(topic.getName().replaceAll(" ",""), topic);

        branch.setTopicList(topicMap);
		return branchRepository.save(branch);
	
	}
	
	
	@RequestMapping(value="{branchId}/{topicId}/addSubTopic",method=RequestMethod.POST)
	@ResponseBody
	public Branch addSubTopicToTopic(@PathVariable("branchId") String branchId, @PathVariable("topicId") String topicId, @RequestBody SubTopic subTopic){
		
		String topicId_dec = "";
		
	    try {
			topicId_dec = URLDecoder.decode(topicId, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    System.out.println(topicId_dec);
		
		Branch branch = branchService.getBranchById(branchId);
		HashMap<String, Topic> topicMap = branch.getTopicList();
		HashMap<String, SubTopic> subTopicMap = new HashMap<String, SubTopic>();
		
		if(topicMap.get(topicId_dec).getSubTopicList()!=null){
			subTopicMap = topicMap.get(topicId_dec).getSubTopicList();
		}
		
		subTopicMap.put(subTopic.getName().replaceAll(" ", ""), subTopic);
		Topic updatedTopic = topicMap.get(topicId_dec);
		updatedTopic.setSubTopicList(subTopicMap);
		topicMap.put(topicId, updatedTopic);
		branch.setTopicList(topicMap);
		
		return branchRepository.save(branch);
		
		
	}
	
	
	@RequestMapping(value="{branchId}/{topicId}/{subTopicId}/addConcept",method=RequestMethod.POST)
	@ResponseBody
	public Branch addConceptToSubTopic(@PathVariable("branchId") String branchId,
									   @PathVariable("topicId") String topicId,
									   @PathVariable("subTopicId") String subTopicId,
									   @RequestBody Concept concept ){
		
		String topicId_dec = "";
		String subTopicId_dec = "";
		
	    try {
			topicId_dec = URLDecoder.decode(topicId, "UTF-8");
			subTopicId_dec = URLDecoder.decode(subTopicId, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		Branch branch = branchService.getBranchById(branchId);
		SubTopic subTopic = branchService.getBranchById(branchId).getTopicList().get(topicId_dec).getSubTopicList().get(subTopicId_dec);
		
		HashMap<String,Concept> conceptMap = new HashMap<String, Concept>();
		
		if(subTopic.getConceptMap()!=null){
			conceptMap = subTopic.getConceptMap();
		}
		
		conceptMap.put(concept.getId(), concept);
		subTopic.setConceptMap(conceptMap);
		
		Topic topic = branchService.getBranchById(branchId).getTopicList().get(topicId_dec);
		topic.getSubTopicList().put(subTopicId_dec, subTopic);
		
		HashMap<String, Topic> topicMap = branch.getTopicList();
		topicMap.put(topicId_dec, topic);

		branch.setTopicList(topicMap);	
		
		
		return branchService.createBranch(branch);
		
	}
	
	
	
	
	
	
}
