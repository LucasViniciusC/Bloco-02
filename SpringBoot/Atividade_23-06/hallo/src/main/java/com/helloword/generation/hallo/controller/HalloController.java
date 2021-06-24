package com.helloword.generation.hallo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HalloController {

	@GetMapping
	public String Hello() {
		return "<h1>Hello Word</h1> <h3>Mentalidades</h3>\r\n"
				+ "    <ul>\r\n"
				+ "        <li>Persistência</li>\r\n"
				+ "        <li>Mentalidade de crescimento</li>\r\n"
				+ "    </ul>\r\n"
				+ "\r\n"
				+ "    <h3>Habilidades</h3>\r\n"
				+ "    <ul>\r\n"
				+ "        <li>Atenção aos detalhes</li>\r\n"
				+ "        <li>Proatividade</li>\r\n"
				+ "    </ul>";
	}
	
	
}
