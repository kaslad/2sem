package ru.kpfu.itis.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.Sex;
import ru.kpfu.itis.app.security.role.Role;


import java.util.List;
import java.util.Optional;

public interface UsersRepository extends JpaRepository<User, Long> {

    //List<User> findAllBySex(Sex string);
    Optional<User> findOneByLogin(String login);
    //Optional<User> findOneBySinceGreaterThanAndUntilLessThan(Long since, Long until);

    //Optional<User> findOneByPhone(String phone);
    Optional<User> findOneByEmail(String email);
    List<User> findAllByRole(Role role);

    Optional<User> findById(Long userId);
}
