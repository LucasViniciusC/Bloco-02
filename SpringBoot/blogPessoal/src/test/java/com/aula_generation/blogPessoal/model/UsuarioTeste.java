package com.aula_generation.blogPessoal.model;

import static org.junit.jupiter.api.Assertions.assertEquals;
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
public class UsuarioTeste {
	
	public Usuario usuario;
	public Usuario usuarioErro = new Usuario();
	
	@Autowired
	private  ValidatorFactory  factory = Validation.buildDefaultValidatorFactory();
	
	Validator validator = factory.getValidator();
	
	@BeforeEach
	public void start() throws ParseException{
		usuario = new Usuario(0L, "Lucas Cruz", "lucascruz@teste.com", "085924");
	}
	
	@Test
	@DisplayName("Verificação de valores não Nulos")
	public void testValidationAtributos() {
		
		Set<ConstraintViolation<Usuario>> violacao = validator.validate(usuario);
		
		System.out.println(violacao.toString());
		
		assertTrue(violacao.isEmpty());
		
	}	
	
	@Test
	@DisplayName("Validação de valores Nulos")
	public void testeValoreNulos() {
		usuario.setUsuario("lucascruz@teste.com");
		Set<ConstraintViolation<Usuario>> violacao = validator.validate(usuario);
		System.out.println(violacao.toString());
		assertFalse(violacao.isEmpty());
	}
	
	@Test
	@DisplayName("Teste de verificação de email")
	public void validacaoEmail() {
		usuario.setUsuario("lucascruz@teste.com");
		Set<ConstraintViolation<Usuario>> violacao = validator.validate(usuario);
		System.out.println(violacao.toString());
		assertEquals("lucascruz@teste.com", usuario.getUsuario());
	}
}
