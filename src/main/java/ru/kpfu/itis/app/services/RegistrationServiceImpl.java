package ru.kpfu.itis.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.app.forms.UserRegistrationForm;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.repositories.UsersRepository;
import ru.kpfu.itis.app.security.role.Role;

@Service
public class RegistrationServiceImpl implements RegistrationService {

    @Autowired
    private ClientService clientService;

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private StringerService stringerService;
    @Autowired
    private CoachService coachService;

    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public void register(UserRegistrationForm userForm) {
        // создаем нового пользователя для БД с ролью USER
        User newUser = User.builder()
                .login(userForm.getLogin())
                .email(userForm .getEmail())
                .hashPassword(passwordEncoder.encode(userForm.getPassword()))
                .role(Role.fromString("CLIENT"))
                .build();
        usersRepository.save(newUser);
        if (newUser.getRole() == Role.CLIENT) {
            newUser = usersRepository.findOneByLogin(newUser.getLogin()).get();
            clientService.register(newUser);
        }
        if (newUser.getRole() == Role.STRINGER){
            newUser = usersRepository.findOneByLogin(newUser.getLogin()).get();
            stringerService.register(newUser);
        }
        if (newUser.getRole() == Role.COACH) {
            newUser = usersRepository.findOneByLogin(newUser.getLogin()).get();
            coachService.register(newUser);
        }
        // сохраняем пользователя
        usersRepository.save(newUser);
    }
}
