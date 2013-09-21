package com.kaykay.questionDb.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaykay.questionDb.domain.Concept;
import com.kaykay.questionDb.repository.ConceptRepository;

@Service
public class ConceptService {
	
	@Autowired
	ConceptRepository conceptRepository;
	
	public List<Concept> getConceptsList(){
		
		return conceptRepository.findAll();
		
	}
	
	
	public Concept createConcept(Concept concept){
		
		concept.setId(UUID.randomUUID().toString());
		return conceptRepository.save(concept);
		
	}

}
