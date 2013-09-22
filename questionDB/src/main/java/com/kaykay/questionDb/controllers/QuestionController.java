package com.kaykay.questionDb.controllers;

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

import com.kaykay.questionDb.domain.Question;
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

	@RequestMapping("{id}")
	@ResponseBody
	public Question getQuestionbyId(@PathVariable("id") String id) {

		return questionService.getQuestionById(id);

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
		question.setConcepts(null);
		question.setTopic(topic);
		question.setOption1(op1);
		question.setOption2(op2);
		question.setOption3(op3);
		question.setOption4(op4);
		
		return questionService.createQuestion(question);
	}
	
	@RequestMapping(value="{subject}")
	public String subjectPage(@PathVariable("subject") String subject, ModelMap model){
		String subject_string = null;
		
		if(subject.equals("P")){
			subject_string = "Physics";
		}
		else if(subject.equals("M")){
			subject_string = "Mathematics";
		}
		else if(subject.equals("C")){
			subject_string = "Chemistry";
		}
		
		
		model.addAttribute("subject", subject_string);
		return "subjectPage";
	}
	
	
	@RequestMapping(value="{subject}/createQuestion")
	public String createQuestion(ModelMap model,@PathVariable("subject") String subject){
		
		String subject_string = null;
		
		if(subject.equals("P")){
			subject_string = "Physics";
		}
		else if(subject.equals("M")){
			subject_string = "Mathematics";
		}
		else if(subject.equals("C")){
			subject_string = "Chemistry";
		}
		model.addAttribute("subject", subject_string);
		model.addAttribute("QUESTION", new Question(subject));
		model.addAttribute("message", "Please enter the details of the question below");
		model.addAttribute("TOPIC_LIST", topicService.getTopicsList());
		model.addAttribute("SUBTOPIC_LIST", subTopicService.getSubTopicsList());
		return "questionsPage";
	}
	
	
	@RequestMapping(value="{subject}/addQuestion",method=RequestMethod.POST)
	public String addQuestion(@ModelAttribute(value="QUESTION") Question question,ModelMap model,@PathVariable("subject") String subject ){
		
		Question question1 = new Question(subject);
		question1.setTopic(question.getTopic());
		question1.setDifficulty(question.getDifficulty());
		question1.setContent(question.getContent());
		question1.setOption1(question.getOption1());
		question1.setOption2(question.getOption2());
		question1.setOption3(question.getOption3());
		question1.setOption4(question.getOption4());
		
		
		questionService.createQuestion(question1);
		
		model.addAttribute("subject", subject);
		model.addAttribute("message", "Successfully saved the question");
		model.addAttribute("QUESTION", new Question(subject));
		model.addAttribute("TOPIC_LIST", topicService.getTopicsList());
		
		return "questionsPage";
	}

}
