package ru.kpfu.itis.app.security.providers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.repositories.UsersRepository;

import java.util.Collection;
import java.util.Optional;

@Component
public class AuthProvider implements AuthenticationProvider {

    @Autowired
    UsersRepository usersRepository;

    @Autowired
    private UserDetailsService userDetailsService;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String username = authentication.getName();
        String password = authentication.getCredentials().toString();

        Optional<User> userOptional = usersRepository.findOneByLogin(username);
		
		//check
        if (userOptional.isPresent()) {

            User user = userOptional.get();

            if (!passwordEncoder.matches(password, user.getHashPassword())) {

                throw new BadCredentialsException("Wrong password or login");
            }

        } else {
            throw new BadCredentialsException("Wrong password or login");
        }


        UserDetails details = userDetailsService.loadUserByUsername(username);
        Collection<? extends GrantedAuthority> authorities = details.getAuthorities();
        return new UsernamePasswordAuthenticationToken(details, password, authorities);
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}