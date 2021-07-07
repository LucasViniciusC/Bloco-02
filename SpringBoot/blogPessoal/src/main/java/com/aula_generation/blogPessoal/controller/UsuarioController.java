package com.aula_generation.blogPessoal.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aula_generation.blogPessoal.model.Usuario;
import com.aula_generation.blogPessoal.model.UsuarioLogin;
import com.aula_generation.blogPessoal.services.UsuarioService;

@RestController
@RequestMapping("/usuario")
@CrossOrigin(origins = "*", allowedHeaders = "*") 
public class UsuarioController {
	
	@Autowired
	private UsuarioService service;
	
	@PostMapping("/logar")
	public ResponseEntity<UsuarioLogin> cadastrar(@RequestBody Optional<UsuarioLogin> user){
		return service.Logar(user).map(resp -> ResponseEntity.ok(resp))
				.orElse(ResponseEntity.status(HttpStatus.UNAUTHORIZED).build());
	}
	
	@PostMapping("/cadastrar")
	private ResponseEntity<Usuario> logar(@RequestBody Usuario usuario){
		return ResponseEntity.status(HttpStatus.CREATED)
				.body(service.cadastrarUsuario(usuario));
	}
}
