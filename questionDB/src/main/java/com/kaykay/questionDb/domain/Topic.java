package com.kaykay.questionDb.domain;

import java.util.HashMap;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Topic implements Comparable<Topic>{
	
	@Id
	private String id;
	private String name;
	private HashMap<String,SubTopic> subTopicList;
	
	//private List<SubTopic> subtopicList;
	
	
	public Topic(){
		
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

	public HashMap<String, SubTopic> getSubTopicList() {
		return subTopicList;
	}

	public void setSubTopicList(HashMap<String, SubTopic> subTopicList) {
		this.subTopicList = subTopicList;
	}

	@Override
	public int compareTo(Topic o) {
		
		return this.name.compareToIgnoreCase(o.name);
		
	}

	
	

}
