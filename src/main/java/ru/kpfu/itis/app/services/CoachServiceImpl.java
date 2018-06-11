package ru.kpfu.itis.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.Coach;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.CoachDegree;
import ru.kpfu.itis.app.model.enums.PlayerDegree;
import ru.kpfu.itis.app.repositories.CoachRepository;

import java.util.List;
import java.util.Optional;
@Service
public class CoachServiceImpl implements CoachService {
    @Autowired
    private CoachRepository coachRepository;

    @Override
    public void register(User user) {

        Coach coach = Coach.builder()
                .user(user)
                .playerDegree(PlayerDegree.NONE)
                .coachDegree(CoachDegree.THIRD)
                .build();
        coachRepository.save(coach);
    }

    @Override
    public void updateInfo(UserEditForm userEditForm, Coach coach) {
        coach.setPlayerDegree(PlayerDegree.valueOf(userEditForm.getPlayerDegree()));
        coach.setCoachDegree(CoachDegree.valueOf(userEditForm.getCoachDegree()));
        coach.setPrice(Integer.parseInt(userEditForm.getPrice()));
        coachRepository.save(coach);
    }

    @Override
    public List<Coach> findAllByPriceIn(Integer price1, Integer price2) {
        return coachRepository.findByPriceBetween(price1,price2);
    }

    @Override
    public List<Coach> findAllByCoachDegreeAndPlayerDegreeAndUserNameContaining(CoachDegree coachDegree, PlayerDegree playerDegree, String username) {
        return coachRepository.findAllByCoachDegreeAndPlayerDegreeAndUserNameContaining(coachDegree, playerDegree, username);
    }

    @Override
    public Optional<Coach> getDataByUser(User userByAuthentication) {
        return coachRepository.findOneByUser(userByAuthentication);
    }
}
