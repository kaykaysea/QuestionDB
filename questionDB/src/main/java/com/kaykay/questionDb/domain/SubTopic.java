package com.kaykay.questionDb.domain;

import java.util.HashMap;

import org.springframework.data.annotation.Id;

public class SubTopic implements Comparable<SubTopic> {
	
	@Id
	private String id;
	private String name;
	private HashMap<String, Concept> conceptMap;
	
	
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
	public HashMap<String, Concept> getConceptMap() {
		return conceptMap;
	}
	public void setConceptMap(HashMap<String, Concept> conceptMap) {
		this.conceptMap = conceptMap;
	}
	@Override
	public int compareTo(SubTopic o) {
		
		return this.name.compareToIgnoreCase(o.name);
		
	}
	
}
