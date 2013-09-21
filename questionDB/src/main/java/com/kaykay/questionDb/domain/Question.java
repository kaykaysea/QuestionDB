package com.kaykay.questionDb.domain;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;


@Document
public class Question {
	
	@Id
	private String id;
	private String content;
	private String topic;
	private String subTopic;
	private List<String> concepts;
	private String difficulty;
	
	private String option1; 
	private String option2;
	private String option3;
	private String option4;
	
	public Question(){
		
	}

	public Question(String content, String topic,String subTopic, List<String> concepts,String difficulty,
			String option1, String option2, String option3, String option4) {
		super();
		this.content = content;
		this.topic = topic;
		this.subTopic = subTopic;
		this.concepts = concepts;
		this.difficulty = difficulty;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getSubTopic() {
		return subTopic;
	}

	public void setSubTopic(String subTopic) {
		this.subTopic = subTopic;
	}

	public List<String> getConcepts() {
		return concepts;
	}

	public void setConcepts(List<String> concepts) {
		this.concepts = concepts;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}
	
	
	//TODO append other characters of the question to the toString method
	public String toString(){
		
		return "Question [id=" + id ;
	}
	
	
	
	
	

}