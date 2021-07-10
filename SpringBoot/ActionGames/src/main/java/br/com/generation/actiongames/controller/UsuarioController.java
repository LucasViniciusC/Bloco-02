package br.com.generation.actiongames.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.generation.actiongames.model.Usuario;
import br.com.generation.actiongames.model.UsuarioLogin;
import br.com.generation.actiongames.repository.UsuarioRepository;
import br.com.generation.actiongames.services.UsuarioService;

@RestController
@RequestMapping("/usuario")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class UsuarioController {

	@Autowired
	private UsuarioRepository repository;

	@Autowired
	private UsuarioService service;

	@GetMapping("/listarTodos")
	public ResponseEntity<List<Usuario>> listarTudo(){
		return ResponseEntity.ok(repository.findAll());
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Usuario> buscarId(@PathVariable long id){
		return repository.findById(id).map(resp -> ResponseEntity.ok(resp))
				.orElse(ResponseEntity.notFound().build());
	}
	
	@PostMapping("/logar")
	public ResponseEntity<UsuarioLogin> logar(@RequestBody Optional<UsuarioLogin> usuario) {
		return service.logarUsuario(usuario).map(resp -> ResponseEntity.ok(resp))
				.orElse(ResponseEntity.status(HttpStatus.UNAUTHORIZED).build());
	}
	
	@PostMapping("/cadastrar")
	public ResponseEntity<Optional<Usuario>> cadastrar(@RequestBody Usuario usuario){
		Optional<Usuario> novoUsuario = service.cadastraUsuario(usuario);
		try {
			return ResponseEntity.status(HttpStatus.CREATED).body(novoUsuario);
		}catch(Exception e){
			return ResponseEntity.badRequest().build();
		}
	}
	@PostMapping("/alterar")
	public ResponseEntity<Usuario> alterar(@RequestBody Usuario usuario){
		Optional<Usuario> updateUsuario = service.atualizarDados(usuario);
		try {
			return ResponseEntity.ok(updateUsuario.get());
		}catch(Exception e){
			return ResponseEntity.badRequest().build();
		}
	}
	
}
