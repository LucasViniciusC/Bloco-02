package com.aula_generation.blogPessoal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aula_generation.blogPessoal.model.Postagem;
import com.aula_generation.blogPessoal.repository.PostagemRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin("*")
public class PostagemController {

	@Autowired
	PostagemRepository postagemRepository;
	
	//Listando os dados inseridos na tabela
	@GetMapping("/listarpostagem")
	public List<Postagem> listaPostagens(){
		return postagemRepository.findAll();
	}
	
	//Buscando um dado por ID
	@GetMapping("/postagemespecifica/{id}")
	public Postagem listaProdutoEspecifico(@PathVariable(value="id") long id) {
		return postagemRepository.findById(id);
	}
	
	//Inserindo um novo dado na tabela
	@PostMapping("/postagem")
	public Postagem novaPostagem(@RequestBody Postagem postagem) {
		return postagemRepository.save(postagem);
	}
	//Deletando um dado na tabela
	@DeleteMapping("/postagem")
	public void apagarPostagem(@RequestBody Postagem postagem) {
		postagemRepository.delete(postagem);
	}
	
	//Alterando um dado na tabela
	@PutMapping("/postagem")
	public Postagem alterarPostagem(@RequestBody Postagem postagem) {
		return postagemRepository.save(postagem);
	}
}
