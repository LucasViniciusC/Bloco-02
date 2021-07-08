package com.aula_generation.blogPessoal.model;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Set;
import java.text.ParseException;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class PostagemTeste {

	public Postagem postagem;
	public Postagem postagemErro = new Postagem();

	@Autowired
	private ValidatorFactory factory = Validation.buildDefaultValidatorFactory();

	Validator validator = factory.getValidator();

	@BeforeEach
	public void start() throws ParseException {
		postagem = new Postagem(0L, "Curso de Java", "Aprendendo Java com Spring MVC");
	}
	
	@Test
	@DisplayName("Verificação se não a valores nulos")
	public void validaValoresNaoNulos() {
		Set<ConstraintViolation<Postagem>> violacao = validator.validate(postagem);
		System.out.println(violacao.toString());
		assertTrue(violacao.isEmpty());
	}

	@Test
	@DisplayName("Verificação se a valores nulos")
	public void validaValoresNulos() {
		Set<ConstraintViolation<Postagem>> violacao = validator.validate(postagem);
		System.out.println(violacao.toString());
		assertFalse(violacao.isEmpty());
	}
}
