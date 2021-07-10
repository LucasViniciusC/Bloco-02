package br.com.generation.actiongames.services;

import java.nio.charset.Charset;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import br.com.generation.actiongames.model.Usuario;
import br.com.generation.actiongames.model.UsuarioLogin;
import br.com.generation.actiongames.repository.UsuarioRepository;

/* A classe Service fica encarregada de trabalhar com as eventuais regras de negócio, então toda parte
de gravar um novo dado no banco de dados será controlado por ela.*/
@SuppressWarnings("deprecation")
@Service
public class UsuarioService {

	@Autowired
	private UsuarioRepository repository;

	public Optional<Usuario> cadastraUsuario(Usuario usuario) {
		// Verificação se o usuário é já é presente no banco de dados.
		if (repository.findByUsuario(usuario.getUsuario()).isPresent())
			return null;
		
		/*Instanciando um objeto da classe BCryptPasswordEncoder que é responsável por gerar
		a criptografia da senha do usuário*/
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		/*Pegando a senha do usuário e aplicando a criptografia atráves do método .encode() */
		String senhaEncoder = encoder.encode(usuario.getSenha());
		
		/*Atribuindo a senha já criptografada a senha do usuário*/
		usuario.setSenha(senhaEncoder);
		
		/*Salvando os dados no banco de dados*/
		return Optional.of(repository.save(usuario));
	}

	public Optional<Usuario> atualizarDados(Usuario usuario) {
		// Verificação se o usuário é já é presente no banco de dados.
		if(repository.findById(usuario.getId()).isPresent()) {

			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String senhaEncoder = encoder.encode(usuario.getSenha());
			usuario.setSenha(senhaEncoder);

			return Optional.of(repository.save(usuario));
		} else {
			// Caso o usuário não seja encontrado o sistema irá retorna um status code 404 de NOT FOUND.
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, null);
		}
	}
	
	public Optional<UsuarioLogin> logarUsuario(Optional<UsuarioLogin> usuarioLogin){
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		Optional<Usuario> usuario = repository.findByUsuario(usuarioLogin.get().getUsuario());
		
		if(usuario.isPresent()) {
			if(encoder.matches(usuarioLogin.get().getSenha(), usuario.get().getSenha())) {
				String auth = usuarioLogin.get().getUsuario() + ":" + usuarioLogin.get().getSenha();
				byte[] encodedAuth = Base64.encode(auth.getBytes(Charset.forName("US-ASCII")));
				String authHeader = "Basic " + new String(encodedAuth);	
				
				usuarioLogin.get().setToken(authHeader);
				usuarioLogin.get().setNome(usuario.get().getNome());
				usuarioLogin.get().setSenha(usuario.get().getSenha());
				return usuarioLogin;
			}
		}
		return null;
	}
}
