package ru.kpfu.itis.app.services;

import ru.kpfu.itis.app.forms.UserRegistrationForm;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.repositories.ClientRepository;

import java.util.Optional;

public class ClientServiceImpl implements ClientService
{

    ClientRepository clientRepository;
    @Override
    public void register(User user) {

    }

    @Override
    public Optional<Client> getDataByUser(User userByAuthentication) {
        return clientRepository.findOneByUser(userByAuthentication);
    }
}
