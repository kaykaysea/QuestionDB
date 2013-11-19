package com.kaykay.questionDb.domain;

import java.util.HashMap;
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
	//private List<Topic> topicList;
	private HashMap<String, Topic> topicList;
	
	
	
			
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

	
	public HashMap<String, Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(HashMap<String, Topic> topicList) {
		this.topicList = topicList;
	}






	
	

}
