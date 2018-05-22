package ru.kpfu.itis.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.User;

import java.util.Optional;

public interface ClientRepository extends JpaRepository <Client, Long> {
    Optional<Client> findOneByUser(User user);
}
