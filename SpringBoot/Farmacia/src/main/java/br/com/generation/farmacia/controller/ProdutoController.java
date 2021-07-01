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

import br.com.generation.farmacia.model.Produto;
import br.com.generation.farmacia.repository.ProdutoRepository;

@RestController
@RequestMapping("/produto")
public class ProdutoController {

	@Autowired
	private ProdutoRepository repository;

	@GetMapping
	private List<Produto> listarTudo() {
		return repository.findAll();
	}

	@GetMapping("/{id}")
	private Produto buscarPorI(@PathVariable long id) {
		return repository.findById(id);
	}

	@GetMapping("/listar/{descricao}")
	private Produto buscarPorDescricao(@PathVariable String descricao) {
		return repository.findByDescricaoContainingIgnoreCase(descricao);
	}
	
	@GetMapping("/buscar/{nome}")
	private List<Produto> buscaPorProduto(@PathVariable String nome){
		return repository.findByNomeContainingIgnoreCase(nome);
	}
	
	@PostMapping("/novo")
	private Produto novoProduto(@RequestBody Produto produto) {
		return repository.save(produto);
	}
	
	@PutMapping("/alterar")
	private Produto alterarProduto(@RequestBody Produto produto) {
		return repository.save(produto);
	}
	
	@DeleteMapping("/{id}")
	private Produto apagarProduto(@PathVariable long id) {
		return repository.deleteById(id);
	}
}
