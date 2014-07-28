package com.kaykay.questionDb.controllers;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kaykay.questionDb.domain.Branch;
import com.kaykay.questionDb.domain.Question;
import com.kaykay.questionDb.domain.Topic;
import com.kaykay.questionDb.service.BranchService;
import com.kaykay.questionDb.service.QuestionService;
import com.kaykay.questionDb.service.SubTopicService;
import com.kaykay.questionDb.service.TopicService;

@Controller
@RequestMapping("/questions")
public class QuestionController {

	@Autowired
	QuestionService questionService;
	
	@Autowired
	TopicService topicService;
	
	@Autowired
	SubTopicService subTopicService;
	
	@Autowired
	BranchService branchService;

	@RequestMapping("{id}")
	@ResponseBody
	public Question getQuestionbyId(@PathVariable("id") String id) {

		return questionService.getQuestionById(id);

	}
	
	@RequestMapping("id/{id}")
		public String displayQuestionById(){
		
		
		return"questionPage";
		
	}
	
	
	@RequestMapping("page")
	public String getQuestionsPage(){
		
		return "questionsPage";
	}
	
	
	@RequestMapping("all")
	@ResponseBody
	public List<Question> getAllQuestions(){
		
		return questionService.getAllQuestions();
	}
	
	
	@RequestMapping("viewAll")
	public String viewAllQuestions(ModelMap model){
		model.addAttribute("QuestionsList",questionService.getAllQuestions());
		
		return "allQuestions";
		
	}
	
	
	@RequestMapping("{content}/{topic}/{concepts}/{op1}/{op2}/{op3}/{op4}")
	@ResponseBody
	public Question submitQuestion(@PathVariable("content") String content,
								   @PathVariable("topic") String topic,
								   @PathVariable("op1") String op1,
								   @PathVariable("op2") String op2,
								   @PathVariable("op3") String op3,
								   @PathVariable("op4") String op4) {
		
		Question question = new Question();
		question.setContent(content);
		//question.setConcepts(null);
		question.setTopic(topic);
		question.setOption1(op1);
		question.setOption2(op2);
		question.setOption3(op3);
		question.setOption4(op4);
		
		return questionService.createQuestion(question);
	}
	
	

	
	@RequestMapping(value="create")
	public String createQuestion(ModelMap model){
		

		model.addAttribute("QUESTION", new Question());
		model.addAttribute("message", "Please enter the details of the question below");
		
		return "questionsPage";
		
	}
	
	
	
	
	
	@RequestMapping(value="updateQuestion",method=RequestMethod.POST)
	public String updateQuestion(@ModelAttribute(value="QUESTION") Question question,ModelMap model ){
		
		question.setContent(question.getContent().replaceAll("<p>|</p>", ""));
		question.setOption1(question.getOption1().replaceAll("<p>|</p>", ""));
		question.setOption2(question.getOption2().replaceAll("<p>|</p>", ""));
		question.setOption3(question.getOption3().replaceAll("<p>|</p>", ""));
		question.setOption4(question.getOption4().replaceAll("<p>|</p>", ""));
		question.setSolution(question.getSolution().replaceAll("<p>|</p>", ""));
		
	
		questionService.updateQuestion(question);
		return "questionPage";
	}
	
	
	@RequestMapping("edit/{id}")
	public String editQuestionById(@PathVariable("id") String id, ModelMap model){
		Question existingQuestion = questionService.getQuestionById(id);
		model.addAttribute("QUESTION", existingQuestion);
		model.addAttribute("QUESTION_ID", id);
		List<Topic> topicList = branchService.getTopicsListByBranch("Physics");
		Collections.sort(topicList);
		
		model.addAttribute("TOPIC_LIST", topicList);
		model.addAttribute("CONTENT", existingQuestion.getContent());
		model.addAttribute("OPTION1",existingQuestion.getOption1());
		model.addAttribute("OPTION2",existingQuestion.getOption2());
		model.addAttribute("OPTION3",existingQuestion.getOption3());
		model.addAttribute("OPTION4",existingQuestion.getOption4());
		return "editQuestion";
		
	}
	
	@RequestMapping("delete/{id}")
	public String deleteQuestionById(@PathVariable("id") String id, ModelMap model){
		//Question existingQuestion = questionService.getQuestionById(id);
		questionService.deleteQuestionById(id);
		model.addAttribute("QuestionsList",questionService.getAllQuestions());
		
	
		return "allQuestions";
		
	}
	
	
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String addQuestion(@ModelAttribute(value="QUESTION") Question question,ModelMap model){
		
		question.setContent(question.getContent().replaceAll("<p>|</p>", ""));
		question.setOption1(question.getOption1().replaceAll("<p>|</p>", ""));
		question.setOption2(question.getOption2().replaceAll("<p>|</p>", ""));
		question.setOption3(question.getOption3().replaceAll("<p>|</p>", ""));
		question.setOption4(question.getOption4().replaceAll("<p>|</p>", ""));
		question.setSolution(question.getSolution());
		
		questionService.createQuestion(question);
		
		model.addAttribute("message", "Successfully saved the question");
	
		return "questionStatus";
	}
	
	
	@RequestMapping("search/{searchString}")
	@ResponseBody
	public List<Question> searchQuestion(@PathVariable("searchString") String searchTerm){
		
		return questionService.getQuestionsBySearchTerm(searchTerm);
		
		
	}
	

}
