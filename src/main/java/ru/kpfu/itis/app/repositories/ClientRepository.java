package ru.kpfu.itis.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.User;

import java.util.Optional;

@Repository
public interface ClientRepository extends JpaRepository <Client, Long> {
    Optional<Client> findOneByUser(User user);
}
