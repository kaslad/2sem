package ru.kpfu.itis.app.services;

import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.UserData;

import java.util.List;

public interface UserDatasService {
    List<UserData> getAll();
    void add(UserEditForm userEditForm);
    UserData getById(Long id);
    void delete(Long id);
}
