package com.aula_generation.blogPessoal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class PostagemController {

	@Autowired
	private PostagemRepository postagemRepository;

	// Listando os dados inseridos na tabela
	@GetMapping("/listarpostagem")
	public List<Postagem> listaPostagens() {
		return postagemRepository.findAll();
	}

	// Buscando um dado por ID
	@GetMapping("/postagemid/{id}")
	public Postagem listaProdutoEspecifico(@PathVariable long id) {
		return postagemRepository.findById(id);
	}
	
	// Buscando por titulo inserido
	@GetMapping("/buscatitulo/{titulo}")
	public ResponseEntity<List<Postagem>> listaPostagemPorTitulo(@PathVariable String titulo){
		return ResponseEntity.ok(postagemRepository.findByTituloContainingIgnoreCase(titulo));
	}
	
	// Inserindo um novo dado na tabela
	@PostMapping("/postagem")
	public Postagem novaPostagem(@RequestBody Postagem postagem) {
		return postagemRepository.save(postagem);
	}

	// Alterando um dado na tabela atráves do id
	@PutMapping("/postagem")
	public Postagem alterarPostagem(@RequestBody Postagem postagem) {
		return postagemRepository.save(postagem);
	}

	// Deletando um dado na tabela atráves do id
	@DeleteMapping("/postagem/{id}")
	public Postagem apagarPostagem(@PathVariable long id) {
		return postagemRepository.deleteById(id);
	}
}
