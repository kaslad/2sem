package ru.kpfu.itis.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.kpfu.itis.app.model.Coach;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.CoachDegree;
import ru.kpfu.itis.app.model.enums.PlayerDegree;


import java.util.List;
import java.util.Optional;

public interface CoachRepository extends JpaRepository<Coach, Long> {
    List<Coach> findAllByPrice(Integer price);
    List<Coach> findByPriceBetween(Integer price1, Integer price2);
    Coach findAllById(Long id);
    List<Coach> findAllByCoachDegreeAndPlayerDegreeAndUserNameContaining(CoachDegree coachDegree, PlayerDegree playerDegree,
                                                                         String username
                                                                         );
    Optional<Coach> findOneByUser(User userByAuthentication);
}
