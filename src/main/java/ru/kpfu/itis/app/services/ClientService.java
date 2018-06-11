package ru.kpfu.itis.app.services;

import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.forms.UserRegistrationForm;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.Stringer;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.CoachDegree;
import ru.kpfu.itis.app.model.enums.PlayerDegree;

import java.util.Optional;

public interface ClientService {
    void register(User user);

    Client findOneByUser(User user);

    void updateInfo(UserEditForm userEditForm, Client client);

    Optional<Client> getDataByUser(User userByAuthentication);
}
