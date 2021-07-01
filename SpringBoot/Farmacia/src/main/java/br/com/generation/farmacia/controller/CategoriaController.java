package br.com.generation.farmacia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.generation.farmacia.model.Categoria;
import br.com.generation.farmacia.repository.CategoriaRepository;

@RestController
@RequestMapping("/categoria")
public class CategoriaController {
	
	@Autowired
	private CategoriaRepository repository;
	
	@GetMapping
	private List<Categoria> listarTudo(){
		return repository.findAll();
	}
	
	@GetMapping("/{id}")
	private Categoria buscarPorId(@PathVariable long id) {
		return repository.findById(id);
	}
	
	@GetMapping("/descricao/{descricaoCategoria}")
	private List<Categoria> buscarPorDescricao(@PathVariable String descricaoCategoria){
		return repository.findByDescricaoCategoriaContainingIgnoreCase(descricaoCategoria);
	}
	
	@PostMapping("/novo")
	private Categoria novaCategoria(@RequestBody Categoria categoria) {
		return repository.save(categoria);
	}
	
	@PutMapping("/alterar")
	private Categoria alterarCategoria(@RequestBody Categoria categoria) {
		return repository.save(categoria);
	}
	
	@DeleteMapping("/apagar/{id}")
	private Categoria apagarCategoria(@PathVariable long id) {
		return repository.deleteById(id); 
	}
}
