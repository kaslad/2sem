package ru.kpfu.itis.app.services;


import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.Coach;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.CoachDegree;
import ru.kpfu.itis.app.model.enums.PlayerDegree;

import java.util.List;
import java.util.Optional;

public interface CoachService {
    void register(User user);

    void updateInfo(UserEditForm userEditForm, Coach coach);
    List<Coach> findAllByPriceIn(Integer price1, Integer price2);

    List<Coach> findAllByCoachDegreeAndPlayerDegreeAndUserNameContaining(CoachDegree coachDegree,
                                                                         PlayerDegree playerDegree, String username);

    Optional<Coach> getDataByUser(User userByAuthentication);
}
