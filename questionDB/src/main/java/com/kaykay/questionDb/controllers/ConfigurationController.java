package com.kaykay.questionDb.controllers;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaykay.questionDb.domain.Branch;
import com.kaykay.questionDb.domain.Concept;
import com.kaykay.questionDb.domain.Exam;
import com.kaykay.questionDb.domain.SubTopic;
import com.kaykay.questionDb.domain.Topic;
import com.kaykay.questionDb.repository.TopicRepository;
import com.kaykay.questionDb.service.ConceptService;
import com.kaykay.questionDb.service.ExamService;
import com.kaykay.questionDb.service.SubTopicService;
import com.kaykay.questionDb.service.TopicService;

@Controller
@RequestMapping("/configuration")
public class ConfigurationController {
	
	@Autowired
	TopicService topicService;
	
	@Autowired
	SubTopicService subTopicService;
	
	@Autowired
	ConceptService conceptService;
	
	@Autowired
	ExamService examService;
	
	@RequestMapping("/")
	public String getConfigurationPage(ModelMap map){
		
		map.addAttribute("TOPIC", new Topic());
		map.addAttribute("TOPIC_LIST", topicService.getTopicsList());
		map.addAttribute("TopicMessage", "Enter the name of a topic");
		map.addAttribute("SUBTOPIC", new SubTopic());
		map.addAttribute("SUBTOPIC_LIST",subTopicService.getSubTopicsList());
		map.addAttribute("SubTopicMessage", "Enter the name of a subtopic");
		map.addAttribute("CONCEPT", new Concept());
		map.addAttribute("CONCEPT_LIST",conceptService.getConceptsList());
		map.addAttribute("ConceptMessage", "Enter the name of a concept");
		map.addAttribute("EXAM", new Exam());
		map.addAttribute("EXAM_LIST",examService.getExamsList());
		map.addAttribute("ExamMessage", "Enter the name of an exam");
		
		return "config";
	}
	
	@RequestMapping(value="addTopic",method=RequestMethod.POST)
	public String createTopic(@ModelAttribute("TOPIC") Topic topic, ModelMap map){
				
		Topic topic1 = new Topic();
		topic1.setName(topic.getName());
		topicService.createTopic(topic1);
		
		map.addAttribute("TopicMessage", "Topic saved successfully");
		map.addAttribute("SubTopicMessage", "Enter the name of a sub topic");
		map.addAttribute("ConceptMessage", "Enter the name of a concept");
		map.addAttribute("ExamMessage", "Enter the name of an exam");
		map.addAttribute("TOPIC_LIST", topicService.getTopicsList());
		map.addAttribute("SUBTOPIC_LIST", subTopicService.getSubTopicsList());
		map.addAttribute("CONCEPT_LIST", conceptService.getConceptsList());
		map.addAttribute("EXAM_LIST", examService.getExamsList());
		map.addAttribute("TOPIC", new Topic());
		map.addAttribute("SUBTOPIC", new SubTopic());
		map.addAttribute("CONCEPT", new Concept());
		map.addAttribute("EXAM", new Exam());
		
		return "config";
		
		
	}
	
	
	@RequestMapping(value="topicList")
	@ResponseBody
	public List<String> getTopicsList(){
		
		List<Topic>  topicList = topicService.getTopicsList();
		List<String> topicNameList = new ArrayList<String>();
		
		Iterator<Topic> iterator = topicList.iterator();
		
		while(iterator.hasNext()){
			topicNameList.add(iterator.next().getName());
		}
		
		return topicNameList;
	}
	
	
	@RequestMapping(value="topicListByName")
	@ResponseBody
	public List<String> getTopicsListByName(@RequestParam("term") String name){
		
		List<Topic>  topicList = topicService.getTopicsbyName(name);
		List<String> topicNameList = new ArrayList<String>();
		
		Iterator<Topic> iterator = topicList.iterator();
		
		while(iterator.hasNext()){
			topicNameList.add(iterator.next().getName());
		}
		
		return topicNameList;
	}
	
	
	@RequestMapping(value="subTopicListByName")
	@ResponseBody
	public List<String> getSubTopicsListByName(@RequestParam("term") String name){
		
		List<SubTopic>  subTopicList = subTopicService.getSubTopicsbyName(name);
		List<String> subTopicNameList = new ArrayList<String>();
		
		Iterator<SubTopic> iterator = subTopicList.iterator();
		
		while(iterator.hasNext()){
			subTopicNameList.add(iterator.next().getName());
		}
		
		return subTopicNameList;
	}
	
	@RequestMapping(value="conceptListByName")
	@ResponseBody
	public List<String> getConceptsListByName(@RequestParam("term") String name){
		
		List<Concept>  conceptList = conceptService.getConceptsbyName(name);
		List<String> conceptNameList = new ArrayList<String>();
		
		Iterator<Concept> iterator = conceptList.iterator();
		
		while(iterator.hasNext()){
			conceptNameList.add(iterator.next().getName());
		}
		
		return conceptNameList;
	}
	
	@RequestMapping(value="examListByName")
	@ResponseBody
	public List<String> getExamsListByName(@RequestParam("term") String name){
		
		List<Exam>  examList = examService.getExamsbyName(name);
		List<String> examNameList = new ArrayList<String>();
		
		Iterator<Exam> iterator = examList.iterator();
		
		while(iterator.hasNext()){
			examNameList.add(iterator.next().getName());
		}
		
		return examNameList;
	}
	
	
	
	@RequestMapping(value="addSubTopic",method=RequestMethod.POST)
	public String createSubTopic(@ModelAttribute("SUBTOPIC") SubTopic subTopic, ModelMap map){
				
		SubTopic subTopic1 = new SubTopic();
		subTopic1.setName(subTopic.getName());
		subTopicService.createSubTopic(subTopic1);
		
		map.addAttribute("TopicMessage", "Enter the name of a topic");
		map.addAttribute("SubTopicMessage", "Sub Topic saved successfully");
		map.addAttribute("ConceptMessage", "Enter the name of a concept");
		map.addAttribute("ExamMessage", "Enter the name of an exam");
		map.addAttribute("TOPIC_LIST", topicService.getTopicsList());
		map.addAttribute("SUBTOPIC_LIST", subTopicService.getSubTopicsList());
		map.addAttribute("CONCEPT_LIST", conceptService.getConceptsList());
		map.addAttribute("EXAM_LIST", examService.getExamsList());
		map.addAttribute("TOPIC", new Topic());
		map.addAttribute("SUBTOPIC", new SubTopic());
		map.addAttribute("CONCEPT", new Concept());
		map.addAttribute("EXAM", new Exam());
		
		return "config";
		
		
	}
	
	
	@RequestMapping(value="addConcept",method=RequestMethod.POST)
	public String createConcept(@ModelAttribute("CONCEPT") Concept concept, ModelMap map){
				
		Concept concept1 = new Concept();
		concept1.setName(concept.getName());
		conceptService.createConcept(concept1);
		
		map.addAttribute("TopicMessage", "Enter the name of a topic");
		map.addAttribute("SubTopicMessage", "Enter the name of a sub topic");
		map.addAttribute("ConceptMessage", "Concept saved successfully");
		map.addAttribute("ExamMessage", "Enter the name of an exam");
		map.addAttribute("TOPIC_LIST", topicService.getTopicsList());
		map.addAttribute("SUBTOPIC_LIST", subTopicService.getSubTopicsList());
		map.addAttribute("CONCEPT_LIST", conceptService.getConceptsList());
		map.addAttribute("EXAM_LIST", examService.getExamsList());
		map.addAttribute("TOPIC", new Topic());
		map.addAttribute("SUBTOPIC", new SubTopic());
		map.addAttribute("CONCEPT", new Concept());
		map.addAttribute("EXAM", new Exam());
		
		return "config";
		
		
	}
	
	@RequestMapping(value="addExam",method=RequestMethod.POST)
	public String createExam(@ModelAttribute("EXAM") Exam exam, ModelMap map){
				
		Exam exam1 = new Exam();
		exam1.setName(exam.getName());
		examService.createExam(exam1);
		
		map.addAttribute("TopicMessage", "Enter the name of a topic");
		map.addAttribute("SubTopicMessage", "Enter the name of a sub topic");
		map.addAttribute("ConceptMessage", "Enter the name of a concept");
		map.addAttribute("ExamMessage", "Exam saved successfully");
		map.addAttribute("TOPIC_LIST", topicService.getTopicsList());
		map.addAttribute("SUBTOPIC_LIST", subTopicService.getSubTopicsList());
		map.addAttribute("CONCEPT_LIST", conceptService.getConceptsList());
		map.addAttribute("EXAM_LIST", examService.getExamsList());
		map.addAttribute("TOPIC", new Topic());
		map.addAttribute("SUBTOPIC", new SubTopic());
		map.addAttribute("CONCEPT", new Concept());
		map.addAttribute("EXAM", new Exam());
		
		return "config";
		
		
	}
	
	
	

}
