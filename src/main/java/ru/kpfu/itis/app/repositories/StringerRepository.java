package ru.kpfu.itis.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.app.model.Stringer;
import ru.kpfu.itis.app.model.User;

import java.util.List;
import java.util.Optional;


public interface StringerRepository extends JpaRepository<Stringer, Long>  {
    List<Stringer> findAllByPrice(Integer price);
    List<Stringer> findAllById(Long id);

    Optional<Stringer> findOneByUser(User user);
}
