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

import com.aula_generation.blogPessoal.model.Tema;
import com.aula_generation.blogPessoal.repository.TemaRepository;

@RestController
@RequestMapping("/tema")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class TemaController {

	@Autowired
	private TemaRepository repository;

	@GetMapping("/consulta")
	public List<Tema> consultaTodos() {
		return repository.findAll();
	}

	@GetMapping("/consultaid/{id}")
	private Tema buscaID(@PathVariable long id) {
		return repository.findById(id);
	}

	@GetMapping("/consulta/{descricao}")
	private List<Tema> buscarPorTema(@PathVariable String descricao) {
		return repository.findByDescricaoContainingIgnoreCase(descricao);
	}

	@PostMapping("novotema")
	private Tema novoTema(@RequestBody Tema tema) {
		return repository.save(tema);
	}
	
	@PutMapping("/alterartema")
	public Tema alterarTema(@RequestBody Tema tema) {
		return repository.save(tema);
	}
	
	@DeleteMapping("/apagartema/{id}")
	public Tema apagarTema(@PathVariable long id) {
		return repository.deleteById(id);
	}
	
}
