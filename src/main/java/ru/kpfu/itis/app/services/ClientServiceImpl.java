package ru.kpfu.itis.app.services;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.Stringer;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.PlayerDegree;
import ru.kpfu.itis.app.repositories.ClientRepository;

import java.util.Optional;

@Service
public class ClientServiceImpl implements ClientService
{
    @Autowired
    private ClientRepository clientRepository;

    @Override
    public void register(User user) {

        Client client = Client.builder()
                .user(user)
                .playerDegree(PlayerDegree.NONE)
                .build();
        clientRepository.save(client);
    }

    @Override
    public Client findOneByUser(User user) {
        return  clientRepository.findOneByUser(user).get();
    }

    @Override
    public void updateInfo(UserEditForm userEditForm, Client client) {

        String st = userEditForm.getPlayerDegree().replaceAll("\\s+", "");
        client.setPlayerDegree(PlayerDegree.valueOf(st));
        clientRepository.save(client);
    }

    @Override
    public Optional<Client> getDataByUser(User userByAuthentication) {
        return clientRepository.findOneByUser(userByAuthentication);
    }
}
