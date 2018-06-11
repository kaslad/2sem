package ru.kpfu.itis.app.services;

import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.Stringer;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.CoachDegree;
import ru.kpfu.itis.app.model.enums.PlayerDegree;

import java.util.Optional;

public interface StringerService {
    Stringer findOneByUser(User user);
    Optional<Stringer> getDataByUser(User userByAuthentication);

    void updateInfo(UserEditForm userEditForm, Stringer stringer);

    void register(User user);

}
