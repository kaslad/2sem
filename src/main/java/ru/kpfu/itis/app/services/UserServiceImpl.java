package ru.kpfu.itis.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.Sex;
import ru.kpfu.itis.app.repositories.UsersRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    @Autowired
    private UsersRepository usersRepository;

    @Override
    public List<User> getAll() {
        return usersRepository.findAll();
    }

    @Override
    public void add(UserEditForm userEditForm) {

    }

    @Override
    public User getById(Long id) {
        return usersRepository.findById(id).get();
    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public User findOneByEmail(String email) {
        return usersRepository.findOneByEmail(email).get();
    }

    @Override
    public List<User> findAllByNameContaining(String name) {
        return usersRepository.findAllByNameContaining(name);
    }

    @Override
    public void updateInfo(UserEditForm userEditForm, User user) {
        user.setLogin(userEditForm.getLogin());
        user.setEmail(userEditForm.getEmail());
        user.setPhone(userEditForm.getPhone());
        user.setName(userEditForm.getName());

        String st = userEditForm.getPassword1().replaceAll("\\s+", "");

        if(!userEditForm.getPassword1().equals(""))
            user.setHashPassword(passwordEncoder.encode(st));
        usersRepository.save(user);
    }

    @Override
    public Optional<User> findOneByLogin(String login) {
        return usersRepository.findOneByLogin(login);
    }
}
