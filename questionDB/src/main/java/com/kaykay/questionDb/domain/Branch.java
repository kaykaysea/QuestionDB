package com.kaykay.questionDb.domain;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;


/**
 *@author kk
 *This domain class captures the  
 */

@Document
public class Branch {
	
	@Id
	private String id;
	private String name;
	private List<String> topics;
	private List<String> subTopics;
	private List<String> concepts;
	
	public Branch(){
		
	}

	public Branch(String name, List<String> topics, List<String> subTopics,
			List<String> concepts) {
		super();
		this.name = name;
		this.topics = topics;
		this.subTopics = subTopics;
		this.concepts = concepts;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<String> getTopics() {
		return topics;
	}

	public void setTopics(List<String> topics) {
		this.topics = topics;
	}

	public List<String> getSubTopics() {
		return subTopics;
	}

	public void setSubTopics(List<String> subTopics) {
		this.subTopics = subTopics;
	}

	public List<String> getConcepts() {
		return concepts;
	}

	public void setConcepts(List<String> concepts) {
		this.concepts = concepts;
	}
	
	

}
