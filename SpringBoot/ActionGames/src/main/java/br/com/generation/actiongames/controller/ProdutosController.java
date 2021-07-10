package br.com.generation.actiongames.controller;

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

import br.com.generation.actiongames.model.Produto;
import br.com.generation.actiongames.repository.ProdutosRepository;

@RestController
@RequestMapping("/produtos")
public class ProdutosController {

	@Autowired
	private ProdutosRepository repository;

	@GetMapping
	private List<Produto> listarTudo() {
		return repository.findAll();
	}

	@GetMapping("/{id}")
	public Produto getById(@PathVariable long id){
		return repository.findById(id);
	}
	

	@GetMapping("/buscar/{titulo}")
	private Produto buscarUmProduto(@PathVariable String titulo) {
		return repository.findByTituloContainingIgnoreCase(titulo);
	}

	@PostMapping("/novo")
	private Produto novoProduto(@RequestBody Produto produto) {
		return repository.save(produto);
	}

	@PutMapping("/alterar")
	private Produto alterarProduto(@RequestBody Produto produto) {
		return repository.save(produto);
	}

	@DeleteMapping("/apagar/{id}")
	private Produto apagarProduto(@PathVariable long id) {
		return repository.deleteById(id);
	}
}
