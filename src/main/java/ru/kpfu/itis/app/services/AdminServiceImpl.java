package ru.kpfu.itis.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.repositories.UsersRepository;
import ru.kpfu.itis.app.security.role.Role;
import ru.kpfu.itis.app.utils.PasswordGenerator;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private PasswordGenerator passwordGenerator;

    @Autowired
    private PasswordEncoder encoder;


    private ExecutorService executorService = Executors.newCachedThreadPool();

    @Override
    public List<User> getAllUsers() {
        return usersRepository.findAllByRole(Role.USER);
    }

    // метод выполняется полностью, либо вообще не выполняется
    @Transactional
    @Override
    public void createTempPassword(Long userId) {
        // получаем пользователя
        Optional<User> existedUser = usersRepository.findById(userId);
        // никому не говорите
        User admin = usersRepository.findOne(1L);
        // если пользователя нет
        if (!existedUser.isPresent()) {
            throw new IllegalArgumentException("User not found");
        }
        // получаем пользтвателя
        User user = existedUser.get();
        // генерирурем пароль
        String tempPassword = passwordGenerator.generate();
        // и этому пользователю кладем временный пароль
        user.setHashTempPassword(encoder.encode(tempPassword));
        // сохраняем пользователя в бд в новым временным паролем
        usersRepository.save(user);

        /*executorService.submit(() -> {
            // админу на почту скидываем новый пароль
            emailService.sendMail("<h1>" + tempPassword + "</h1>",
                    "Временный пароль для пользователя " + user.getLogin(),
                    admin.getEmail());
        });
        */

    }
}
