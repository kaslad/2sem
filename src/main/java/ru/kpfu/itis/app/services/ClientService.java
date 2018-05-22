package ru.kpfu.itis.app.services;

import ru.kpfu.itis.app.forms.UserRegistrationForm;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.User;

import java.util.Optional;

public interface ClientService {
    void register(User user);

    Optional<Client> getDataByUser(User userByAuthentication);
}
