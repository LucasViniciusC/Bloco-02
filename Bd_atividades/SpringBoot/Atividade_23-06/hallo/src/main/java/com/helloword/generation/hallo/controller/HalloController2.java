package com.helloword.generation.hallo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello2")
public class HalloController2 {

	@GetMapping
	public String hello2() {
		return (" <h1>Hello Word</h1> <h3>Objetivos de aprendizagem</h3>\r\n"
				+ "    <ul>\r\n"
				+ "        <li>Aumentar as minhas Expertises</li>\r\n"
				+ "        <li>Usufluir o máximo dos conteúdos</li>\r\n"
				+ "        <li>Repassar conhecimento para com os meus colegas de turma</li>\r\n"
				+ "    </ul>");
	}
}
