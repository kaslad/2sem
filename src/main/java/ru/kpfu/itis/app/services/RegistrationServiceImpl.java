package ru.kpfu.itis.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.app.forms.UserRegistrationForm;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.repositories.UsersRepository;
import ru.kpfu.itis.app.security.role.Role;


/**
 * 10.11.2017
 * RegistrationServiceImpl
 *
 * @author Sidikov Marsel (First Software Engineering Platform)
 * @version v1.0
 */
@Service
public class RegistrationServiceImpl implements RegistrationService {

    @Autowired
    private UsersRepository usersRepository;

    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public void register(UserRegistrationForm userForm) {
        // создаем нового пользователя для БД с ролью USER
        User newUser = User.builder()
                .login(userForm.getLogin())
                .email(userForm.getEmail())
                .hashPassword(passwordEncoder.encode(userForm.getPassword()))
                .role(Role.fromString(userForm.getRole()))
                .build();
        usersRepository.save(newUser);
        if (newUser.getRole() == Role.CLIENT) {
            newUser = usersRepository.findOneByLogin(newUser.getLogin()).get();
            participantService.register(newUser);
        }
        // сохраняем пользователя
        usersRepository.save(newUser);
    }
}
