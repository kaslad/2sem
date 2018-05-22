package ru.kpfu.itis.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.app.model.Stringer;

import java.util.List;


public interface StringerRepository extends JpaRepository<Stringer, Long>  {
    List<Stringer> findAllByPrice(Integer price);
    List<Stringer> findAllById(Long id);
}
