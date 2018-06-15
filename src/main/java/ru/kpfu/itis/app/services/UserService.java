package ru.kpfu.itis.app.services;

import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.User;


import java.util.List;
import java.util.Optional;

public interface UserService {
    List<User> getAll();
    void add(UserEditForm userEditForm);
    User getById(Long id);
    void delete(Long id);

    User findOneByEmail(String email);

    List<User> findAllByNameContaining(String name);


    void updateInfo(UserEditForm userEditForm, User user);

    Optional<User> findOneByLogin(String login);
}
