package ru.kpfu.itis.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.app.model.Coach;
import ru.kpfu.itis.app.model.enums.CoachDegree;
import ru.kpfu.itis.app.model.enums.PlayerDegree;


import java.util.List;

public interface CoachRepository extends JpaRepository<Coach, Long> {
    List<Coach> findAllByPrice(Integer price);
    Coach findAllById(Long id);
    }
